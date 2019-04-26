//
//  DashesLine.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/14.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "DashesLine.h"

@interface DashesLine()

@property (strong, nonatomic) UIColor * lineColor;
@property (assign, nonatomic) CGFloat lineLongth;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGPoint endPoint;

@end

@implementation DashesLine

+ (instancetype)dashesLineFrom:(CGPoint)start to:(CGPoint)end withColor:(UIColor *)color andWidth:(CGFloat)width{
    DashesLine * new = [[DashesLine alloc] initLineFrom:start to:end withColor:color andWidth:width];
    new.backgroundColor = [UIColor clearColor];
    return new;
}

- (instancetype)initLineFrom:(CGPoint)start to:(CGPoint)end withColor:(UIColor *)color andWidth:(CGFloat)width{
    if (start.x == end.x && start.y == end.y) {
        return [super initWithFrame:CGRectMake(start.x, start.y, 0, 0)];;
    }
    
    CGFloat verticalDistance = end.y - start.y;
    CGFloat horizontalDistance = end.x - start.x;
    CGFloat lineLongth = sqrt(powf((verticalDistance), 2.0) + powf((horizontalDistance), 2.0));
    self = [super initWithFrame:CGRectMake(start.x, start.y, lineLongth, width)];
    if (self) {
        self.startPoint = start;
        self.endPoint = end;
        self.lineWidth = width;
        self.lineColor = color;
        self.lineLongth = lineLongth;
        
        //计算旋转角度和旋转后的视图中心
        self.center = [self desiredCenter];
        self.transform = CGAffineTransformMakeRotation([self desiredAngle]);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, self.lineColor.CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, self.lineWidth);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.lineLongth, 0);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {5,2};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

- (UIColor *)lineColor{
    if (!_lineColor) {
        _lineColor = [UIColor colorWithWhite:0.9375 alpha:1];
    }
    return _lineColor;
}

- (CGPoint)desiredCenter{
    return CGPointMake((self.endPoint.x + self.startPoint.x)/2, (self.endPoint.y + self.startPoint.y)/2);
}

//返回旋转角度
- (CGFloat)desiredAngle{
    CGFloat verticalDistance = self.endPoint.y - self.startPoint.y;
    CGFloat horizontalDistance = self.endPoint.x - self.startPoint.x;
	//反正切，结果范围（-M_PI, M_PI）
    return atan2(verticalDistance, horizontalDistance);
}

@end
