//
//  ChartDataEntry+Addation.m
//  CategorysDemo
//
//  Created by eyoung on 2018/7/30.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "ChartDataEntry+Addation.h"
#import <objc/runtime.h>

NSString const * valueNameKey   = @"valueNameKey";
NSString const * valueNumbKey   = @"valueNumbKey";

@implementation ChartDataEntry (Addation)

- (NSString *)valueName{
    return objc_getAssociatedObject(self, &valueNameKey);
}

- (void)setValueName:(NSString *)valueName{
    objc_setAssociatedObject(self, &valueNameKey, valueName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)valueNumb{
    return [objc_getAssociatedObject(self, &valueNumbKey) floatValue];
}

- (void)setValueNumb:(CGFloat)valueNumb{
    objc_setAssociatedObject(self, &valueNumbKey, [NSNumber numberWithFloat:valueNumb], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
