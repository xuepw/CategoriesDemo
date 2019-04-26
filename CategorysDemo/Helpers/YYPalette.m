//
//  YYPalette.m
//  YiyangDoctorNew
//
//  Created by 王俊硕 on 2018/3/19.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYPalette.h"

@implementation YYPalette

+(YYPalette *)shared{
    static YYPalette* palette = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        palette = [YYPalette new];
    });
    return palette;
}

- (UIColor *)b1866AC {
    return [UIColor sy_colorWithString:@"#1866AC"];
}
- (UIColor *)b333333 {
    return [UIColor sy_colorWithString:@"#333333"];
}
- (UIColor *)b666666 {
    return [UIColor sy_colorWithString:@"#666666"];
}
- (UIColor *)gDFDFDD {
    return [UIColor sy_colorWithString:@"#DFDFDD"];
}
- (UIColor *)gB3B3B3 {
    return [UIColor sy_colorWithString:@"#B3B3B3"];
}
- (UIColor *)gAAAAAA {
    return [UIColor sy_colorWithString:@"#AAAAAA"];
}
- (UIColor *)wECF0F4 {
    return [UIColor sy_colorWithString:@"#ECF0F4"];
}
- (UIColor *)wEEEEEE {
    return [UIColor sy_colorWithString:@"#EEEEEE"];
}
- (UIColor *)wFFFFFF {
    return [UIColor sy_colorWithString:@"#FFFFFF"];
}
- (UIColor *)b325AF5 {
    return [UIColor sy_colorWithString:@"#325AF5"];
}
- (UIColor *)oFF6C00 {
    return [UIColor sy_colorWithString:@"#FF6C00"];
}
- (UIColor *)rE1401A {
    return [UIColor sy_colorWithString:@"#E1401A"];
}
@end


