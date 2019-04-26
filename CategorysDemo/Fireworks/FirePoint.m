//
//  FirePoint.m
//  CategorysDemo
//
//  Created by eyoung on 2018/8/6.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#define AnimateDuration 3.0

#import "FirePoint.h"

@interface FirePoint()<CAAnimationDelegate>

@property (assign, nonatomic) CGPoint startP;
@property (assign, nonatomic) CGPoint controlP;
@property (assign, nonatomic) CGPoint endP;

@end

@implementation FirePoint

- (instancetype)initWithStartP:(CGPoint)start andDirection:(CGFloat)direc andSpeed:(CGFloat)speed{
    if (self = [super init]) {
        self.frame = CGRectMake(start.x-5, start.y-5, 10, 10);
        self.backgroundColor = [UIColor sy_randomColor].CGColor;
        self.masksToBounds = YES;
        self.cornerRadius = 5;
        [self getEndPointWithSatrtP:start andDirection:direc andSpeed:speed];
    }
    return self;
}

- (void)getEndPointWithSatrtP:(CGPoint)start andDirection:(CGFloat)direc andSpeed:(CGFloat)speed{
    self.startP = start;
    
    //计算ControlP
    CGFloat controlX = self.startP.x+AnimateDuration*speed*cos(direc);
    CGFloat controlY = self.startP.y-AnimateDuration*speed*sin(direc);
    self.controlP = CGPointMake(controlX, controlY);
    
    //计算EndP
    CGFloat endY = Kheight-self.startP.y;
    self.endP = CGPointMake(controlX, endY);
}

- (void)doBallisticMovement{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.startP.x, self.startP.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.controlP.x , self.controlP.y, self.endP.x, self.endP.y);
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.delegate = self;
    animate.duration = AnimateDuration;
    animate.fillMode = kCAFillModeForwards;
    animate.repeatCount = 0;
    animate.path = path;
    animate.removedOnCompletion = NO;
    CGPathRelease(path);
	
    [self addAnimation:animate forKey:@"jakillTest"];
}

#pragma mark ----------CAAnimationDelegate----------
- (void)animationDidStart:(CAAnimation *)anim{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [self performSelector:@selector(removeFromSuperlayer) withObject:nil afterDelay:0.2];
    }
}

@end
