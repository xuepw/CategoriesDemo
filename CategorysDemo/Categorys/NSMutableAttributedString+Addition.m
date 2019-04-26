//
//  NSMutableAttributedString+Addition.m
//  CategorysDemo
//
//  Created by eyoung on 2018/8/22.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "NSMutableAttributedString+Addition.h"

@implementation NSMutableAttributedString (Addition)

- (void)appendString:(NSString *)str
            withFont:(UIFont *)font
           textColor:(UIColor *)color{
    if (str == nil || [str isEqual:[NSNull null]] || str.length == 0) return;
    NSMutableDictionary * attributDic = [NSMutableDictionary dictionary];
    [attributDic setValue:font forKey:NSFontAttributeName];
    [attributDic setValue:color forKey:NSForegroundColorAttributeName];
    NSMutableAttributedString * addStr = [[NSMutableAttributedString alloc] initWithString:str];
    [addStr addAttributes:attributDic range:NSMakeRange(0, str.length)];
    [self appendAttributedString:addStr];
}

@end
