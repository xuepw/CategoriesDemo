//
//  UIColor+ZYQColor.h
//  YYChildren
//
//  Created by YY_ZYQ on 2017/9/11.
//  Copyright © 2017年 Yiyang_zyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZYQColor)

/**
 * 根据字符串变成颜色
 */
+ (UIColor *)sy_colorWithString:(NSString *)str;

/**
 * 根据字符串和透明度获取颜色
 * str 十六进制字符串
 * alpha 透明度
 */
+ (UIColor *)sy_colorWithString:(NSString *)str alpha:(CGFloat)alpha;

/**
 * 背景颜色
 */
+ (UIColor *)sy_backgroundColor;


/**
 * 随机颜色
 */
+ (UIColor *)sy_randomColor;
@end
