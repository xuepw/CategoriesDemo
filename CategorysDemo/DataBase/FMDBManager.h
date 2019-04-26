//
//  FMDBManager.h
//  CategorysDemo
//
//  Created by eyoung on 2018/12/25.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB/FMDB.h>

@interface FMDBManager : NSObject

+ (instancetype)shared;

//更新医生姓名、头像
- (void)updateDoctor:(NSString *)doctorid withName:(NSString *)name headUrl:(NSString *)url;
//查询医生姓名、头像
- (void)selectNameHeadOfDoctor:(NSString *)doctorid complete:(void(^)(FMResultSet * resultSet))finished;
//更新患者姓名头像
- (void)updateUser:(NSString *)userid withName:(NSString *)name head:(NSString *)head;
//查询患者头像姓名
- (void)selectNameHeadOfUser:(NSString *)userid complete:(void(^)(NSDictionary * resultDic))finished;

@end
