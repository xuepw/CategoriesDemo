//
//  FirePoint.h
//  CategorysDemo
//
//  Created by eyoung on 2018/8/6.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FirePoint : CALayer

- (instancetype)initWithStartP:(CGPoint)start andDirection:(CGFloat)direc andSpeed:(CGFloat)speed;
- (void)doBallisticMovement;

@end
