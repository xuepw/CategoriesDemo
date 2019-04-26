//
//  UIColor+ZYQColor.m
//  YYChildren
//
//  Created by YY_ZYQ on 2017/9/11.
//  Copyright © 2017年 Yiyang_zyq. All rights reserved.
//

#import "UIColor+ZYQColor.h"

@implementation UIColor (ZYQColor)

+ (UIColor *)sy_backgroundColor
{
    return [UIColor sy_colorWithString:@"#ECF0F4"];
}


+ (UIColor *)sy_colorWithString:(NSString *)str
{
    return [UIColor sy_colorWithString:str alpha:1.0];
}


+ (UIColor *)sy_colorWithString:(NSString *)str alpha:(CGFloat)alpha
{
    if (![str hasPrefix:@"#"]) {
        str = [NSString stringWithFormat:@"#%@", str];
    }
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor sy_colorWithHex:x alpha:alpha];
}

+ (UIColor *)sy_colorWithHex:(long)col alpha:(CGFloat)alpha
{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:alpha];
}

+ (UIColor *)sy_randomColor{
    NSInteger r = random()%256;
    NSInteger g = random()%256;
    NSInteger b = random()%256;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

@end
