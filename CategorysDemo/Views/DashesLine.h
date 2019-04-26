//
//  DashesLine.h
//  CategorysDemo
//
//  Created by eyoung on 2018/5/14.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashesLine : UIView

+ (instancetype)dashesLineFrom:(CGPoint)start to:(CGPoint)end withColor:(UIColor *)color andWidth:(CGFloat)width;

@end
