//
//  YYEasyStore.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/3.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYEasyStore : NSObject

+ (instancetype)sharedInstance;

//存储、读取、删除数据
- (void)storeData:(NSData *)data forKey:(NSString *)key;
- (NSData *)readDataForKey:(NSString *)key;
- (void)deleteDataForKey:(NSString *)key;

//存储、读取、删除字符串
- (void)storeString:(NSString *)str forKey:(NSString *)key;
- (NSString *)readStringForKey:(NSString *)key;
- (void)deleteStringForKey:(NSString *)key;

//存储字符串数组
- (void)storeArray:(NSArray<NSString *>*)strArr forKey:(NSString *)key;
- (NSMutableArray *)readStringArrForKey:(NSString *)key;
- (void)deleteString:(NSString *)str fromStrArrForKey:(NSString *)key;

//清空存储的数据、字符串
- (void)clearAllData;
- (void)clearAllString;
- (void)clearAllStringArr;

@end
