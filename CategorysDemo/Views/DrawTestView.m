//
//  DrawTestView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/6/28.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "DrawTestView.h"

@implementation DrawTestView

- (void)drawRect:(CGRect)rect{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
    CGContextSetStrokeColorWithColor(context, UIColor.clearColor.CGColor);
    [self drawArch];
}

//画曲线
- (void)drawCurves {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置起点
    CGContextMoveToPoint(context, 50, 50);
    //画曲线
    //参数解析
    //第一个参数是上下文，直接穿上面获取到的。
    //接下来两个参数cpx,cpy这两个是控制在哪一个点产生弧度
    //最后两个参数x,y是终点的位置
    //CGContextAddQuadCurveToPoint(CGContextRef  _Nullable c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
    CGContextAddQuadCurveToPoint(context, 150, 150, 200, 50);
    CGContextStrokePath(context);
}

//画弓形
- (void)drawArch {
    //设置路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //画弓形
    [path addArcWithCenter:CGPointMake(self.width/2, -self.width/sqrtf(2)) radius:self.width startAngle:M_PI_4 endAngle:3*M_PI_4 clockwise:YES];
    [path fill];
}

//画扇形
- (void)drawSector{
    //设置路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //第一个参数是起点，是圆形的圆心
    //第二个参数是半径
    //第三个参数是起始弧度
    //第四个参数是结束弧度
    //第五个参数是传入yes是顺时针,no为顺时针，下面的另外一种实现方法的参数意思也是一致
    //path addArcWithCenter:<#(CGPoint)#> radius:<#(CGFloat)#> startAngle:<#(CGFloat)#> endAngle:<#(CGFloat)#> clockwise:<#(BOOL)#>
    [path addArcWithCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(150, 150)];
    [path fill];
}

@end
