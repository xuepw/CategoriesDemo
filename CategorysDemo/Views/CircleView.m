//
//  CircleView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/14.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()

@property(strong,nonatomic)UIBezierPath *path;
@property(strong,nonatomic)CAShapeLayer *shapeLayer;
@property(strong,nonatomic)CAShapeLayer *bgLayer;

@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.frame = self.bounds;
        _bgLayer.fillColor = [UIColor clearColor].CGColor;
        _bgLayer.lineWidth = 2.f;
        _bgLayer.strokeColor = [UIColor grayColor].CGColor;
        _bgLayer.strokeStart = 0.f;
        _bgLayer.strokeEnd = 1.f;
        _bgLayer.path = _path.CGPath;
        [self.layer addSublayer:_bgLayer];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.bounds;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 2.f;
        _shapeLayer.lineCap = kCALineCapButt;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        _shapeLayer.strokeStart = 0.f;
        _shapeLayer.strokeEnd = 0.f;
        _shapeLayer.path = _path.CGPath;
        [self.layer addSublayer:_shapeLayer];
        
        //从顶部开始画圆
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformRotate(transform, -M_PI / 2);
    }
    return self;
}

@synthesize value = _value;
-(void)setValue:(CGFloat)value{
    _value = value;
    _shapeLayer.strokeEnd = value;
}
-(CGFloat)value{
    return _value;
}

@synthesize lineColor = _lineColor;
-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    _shapeLayer.strokeColor = lineColor.CGColor;
}
-(UIColor*)lineColor{
    return _lineColor;
}

@synthesize backColor = _backColor;
-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    _bgLayer.strokeColor = backColor.CGColor;
}
-(UIColor*)backColor{
    return _backColor;
}

@synthesize lineWidth = _lineWidth;
-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
    _bgLayer.lineWidth = lineWidth;
}
-(CGFloat)lineWidth{
    return _lineWidth;
}

@end
