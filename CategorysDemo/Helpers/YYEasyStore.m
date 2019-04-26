//
//  YYEasyStore.m
//  CategorysDemo
//
//  Created by eyoung on 2018/4/3.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYEasyStore.h"

@interface YYEasyStore()

@property (strong, nonatomic) NSString * dataFilePath;
@property (strong, nonatomic) NSString * stringFilePath;
@property (strong, nonatomic) NSString * strArrFilePath;

@end

@implementation YYEasyStore

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    static YYEasyStore * sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[YYEasyStore alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //程序根目录
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        //数据文件路径
        _dataFilePath = [docPath stringByAppendingString:@"/dataFile.data"];
        //字符串文件路径
        _stringFilePath = [docPath stringByAppendingString:@"/stringFile.data"];
        //字符串数组文件路径
        _strArrFilePath = [docPath stringByAppendingString:@"/stringArrFile.data"];
    }
    return self;
}

//存储、读取、删除数据
- (void)storeData:(NSData *)data forKey:(NSString *)key{
    [self storeObject:data forKey:key intoFilePath:_dataFilePath];
}
- (NSData *)readDataForKey:(NSString *)key{
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:_dataFilePath].mutableCopy;
    return [fileDic objectForKey:key];
}
- (void)deleteDataForKey:(NSString *)key{
    [self deleteObjectForKey:key inFilePath:_dataFilePath];
}

//存储、读取、删除字符串
- (void)storeString:(NSString *)str forKey:(NSString *)key{
    [self storeObject:str forKey:key intoFilePath:_stringFilePath];
}
- (NSString *)readStringForKey:(NSString *)key{
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:_stringFilePath].mutableCopy;
    return [fileDic objectForKey:key];
}
- (void)deleteStringForKey:(NSString *)key{
    [self deleteObjectForKey:key inFilePath:_stringFilePath];
}

//存储字符串数组
- (void)storeArray:(NSArray<NSString *>*)strArr forKey:(NSString *)key{
    [self storeObject:strArr forKey:key intoFilePath:_strArrFilePath];
}
- (NSMutableArray *)readStringArrForKey:(NSString *)key{
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:_strArrFilePath].mutableCopy;
    NSArray * aimArr = [fileDic objectForKey:key];
    if (aimArr) {
        return aimArr.mutableCopy;
    }
    return [NSMutableArray array];
}
- (void)deleteString:(NSString *)str fromStrArrForKey:(NSString *)key{
    [self deleteObjectForKey:key inFilePath:_strArrFilePath];
}

//存储元素基本方法
- (void)storeObject:(id)obj forKey:(NSString *)key intoFilePath:(NSString *)filepath{
    //文件数据
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:filepath].mutableCopy;
    if (!fileDic) {
        fileDic = [NSMutableDictionary dictionary];
    }
    //写入新数据
    [fileDic setObject:obj forKey:key];
    //保存
    [fileDic writeToFile:filepath atomically:NO];
}
//删除元素基本方法
- (void)deleteObjectForKey:(NSString *)key inFilePath:(NSString *)filepath{
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:filepath].mutableCopy;
    if (fileDic[key]) {
        [fileDic removeObjectForKey:key];
    }
    [fileDic writeToFile:filepath atomically:NO];
}

//清空存储的数据、字符串
- (void)clearAllData{
    [self clearAllWithFilePath:_dataFilePath];
}
- (void)clearAllString{
    [self clearAllWithFilePath:_stringFilePath];
}
- (void)clearAllStringArr{
    [self clearAllWithFilePath:_strArrFilePath];
}
- (void)clearAllWithFilePath:(NSString *)filePath{
    NSMutableDictionary * fileDic = [NSDictionary dictionaryWithContentsOfFile:filePath].mutableCopy;
    [[fileDic allKeys] enumerateObjectsUsingBlock:^(NSString * key, NSUInteger idx, BOOL * _Nonnull stop) {
        [fileDic removeObjectForKey:key];
    }];
    [fileDic writeToFile:filePath atomically:NO];
}

@end
