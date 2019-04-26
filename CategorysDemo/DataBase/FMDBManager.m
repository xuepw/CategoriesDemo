//
//  FMDBManager.m
//  CategorysDemo
//
//  Created by eyoung on 2018/12/25.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "FMDatabase.h"
#import "FMDBManager.h"
#import "UIHelper.h"

@interface FMDBManager()

@property (strong, nonatomic) NSString * filePath;
@property (strong, nonatomic) FMDatabase * dataBase;

@end

@implementation FMDBManager

+ (instancetype)shared{
    static dispatch_once_t once;
    static FMDBManager * sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[FMDBManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //数据库路径
        NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        DBLog(@"[FMDB] 文件路径:%@", document);
        self.filePath = [document stringByAppendingPathComponent:@"aaaa.sqlite"];
        self.dataBase = [FMDatabase databaseWithPath:self.filePath];
        [self setupTables];
    }
    return self;
}

- (void)setupTables{
    //初始化表结构 --数据库信息表
    NSString * creatBDInfoStr = @"create table if not exists t_dbinfo(version text not null default '1.0')";
    [self runUpdateWithSqlString:creatBDInfoStr complete:^(BOOL result) {
        DBLog(@"[FMDB] 创建数据库信息表 %@",result?@"完成":@"失败")
    }];
    //初始化表结构 --医生信息表
    NSString * creatDoctorStr = @"create table if not exists t_doctors(doctorid text primary key not null, head text, name text, age integer)";
    [self runUpdateWithSqlString:creatDoctorStr complete:^(BOOL result) {
        DBLog(@"[FMDB] 创建医生信息表 %@",result?@"完成":@"失败")
    }];
    //初始化表结构 --用户信息表
    NSString * creatUsersStr = @"create table if not exists t_users(userid text primary key not null, type text, deviceid text, head text, name text)";
    [self runUpdateWithSqlString:creatUsersStr complete:^(BOOL result) {
        DBLog(@"[FMDB] 创建用户信息表 %@",result?@"完成":@"失败")
    }];
}

//更新(创建、增、删、改)表
- (void)runUpdateWithSqlString:(NSString *)sqlstr complete:(void(^)(BOOL result))finished{
    if (!sqlstr || sqlstr.length == 0) {
        DBLog(@"[FMDB] SQL更新语句为空！已取消执行！")
        return;
    }
    //打开数据库
    if ([self.dataBase open]) {
        BOOL result = [self.dataBase executeUpdate:sqlstr];
        if (finished) {
            finished(result);
        }
    }
    //关闭数据库
    [self.dataBase close];
}

//查询表内容
- (void)runSearchWithSqlString:(NSString *)sqlstr complete:(void(^)(FMResultSet * resultSet))finished{
    if (!sqlstr || sqlstr.length == 0) {
        DBLog(@"[FMDB] SQL查询语句为空！已取消执行！")
        return;
    }
    //打开数据库
    if ([self.dataBase open]) {
        FMResultSet * resultset = [self.dataBase executeQuery:sqlstr];
        if (finished) {
            finished(resultset);
        }
    }
    //关闭数据库
    //[self.dataBase close];
}

//更新医生姓名、头像
- (void)updateDoctor:(NSString *)doctorid withName:(NSString *)name headUrl:(NSString *)url{
    if (!doctorid) return;
    NSString * sqlstr = [NSString stringWithFormat:@"SELECT * FROM t_doctors WHERE doctorid = '%@'",doctorid];
    [self runSearchWithSqlString:sqlstr complete:^(FMResultSet *resultSet) {
        int count = 0;
        while ([resultSet next]) {
            count++;
        }
        NSString * newsqlstr = nil;
        if (count > 0) {
            //记录存在，更新字段
            newsqlstr = [NSString stringWithFormat:@"UPDATE t_doctors SET name = '%@', head = '%@' WHERE doctorid = '%@'",name,url,doctorid];
        } else {
            //记录不存在，插入记录
            newsqlstr = [NSString stringWithFormat:@"INSERT INTO t_doctors (doctorid, name, head) VALUES('%@','%@','%@')",doctorid,name,url];
        }
        if (newsqlstr) {
            [self runUpdateWithSqlString:newsqlstr complete:nil];
        }
    }];
}

//查询医生姓名、头像
- (void)selectNameHeadOfDoctor:(NSString *)doctorid complete:(void(^)(FMResultSet * resultSet))finished{
    if (!doctorid) return;
    NSString * sqlstr = [NSString stringWithFormat:@"SELECT name,head FROM t_doctors WHERE doctorid = '%@'",doctorid];
    [self runSearchWithSqlString:sqlstr complete:^(FMResultSet *resultSet) {
        if (finished) {
            finished(resultSet);
        }
    }];
}

- (void)updateUser:(NSString *)userid withName:(NSString *)name head:(NSString *)head{
    if (!userid) return;
    NSString * sqlstr = [NSString stringWithFormat:@"SELECT * FROM t_users WHERE userid = '%@'",userid];
    [self runSearchWithSqlString:sqlstr complete:^(FMResultSet *resultSet) {
        int count = 0;
        while ([resultSet next]) {
            count++;
        }
        NSString * newsqlstr = nil;
        if (count > 0) {
            //记录存在，更新字段
            newsqlstr = [NSString stringWithFormat:@"UPDATE t_users SET name = '%@', head = '%@' WHERE userid = '%@'",name,head,userid];
            DBLog(@"记录存在，更新字段")
        } else {
            //记录不存在，插入记录
            newsqlstr = [NSString stringWithFormat:@"INSERT INTO t_users (userid, name, head) VALUES('%@','%@','%@')",userid,name,head];
            DBLog(@"记录不存在，插入数据")
        }
        if (newsqlstr) {
            [self runUpdateWithSqlString:newsqlstr complete:^(BOOL result) {
                DBLog(@"操作结果：%@",result?@"成功":@"失败")
            }];
        }
    }];
}

- (void)selectNameHeadOfUser:(NSString *)userid complete:(void(^)(NSDictionary * resultDic))finished{
    if (!userid) return;
    
    NSString * sqlstr = [NSString stringWithFormat:@"SELECT name,head FROM t_users WHERE userid = '%@'",userid];
    [self runSearchWithSqlString:sqlstr complete:^(FMResultSet *resultSet) {
        NSMutableDictionary * resultDic = [NSMutableDictionary dictionary];
        if ([resultSet next]) {
            NSString * name = [resultSet stringForColumn:@"name"];
            NSString * head = [resultSet stringForColumn:@"head"];
            [resultDic setValue:name forKey:@"name"];
            [resultDic setValue:head forKey:@"head"];
            DBLog(@"查询结果  -姓名：%@  -头像：%@",name,head)
        }
        if (finished) {
            finished(resultDic);
        }
    }];
}

- (void)dealloc{
    //关闭数据库
    [self.dataBase close];
}

@end
