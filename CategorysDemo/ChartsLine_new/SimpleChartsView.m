//
//  SimpleChartsView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/21.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "SimpleChartsView.h"

//X轴文本
@interface XAxisValueFormatter()

@end

@implementation XAxisValueFormatter

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis {
    return [NSString stringWithFormat:@"%@h",@(value)];
}

@end

//数值标记
@interface ValueMarkView()

@property (strong, nonatomic) NSString * valueStr;

@end

@implementation ValueMarkView

@synthesize offset;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawWithContext:(CGContextRef _Nonnull)context point:(CGPoint)point {
    UIColor * fillColor = [UIColor colorWithWhite:0 alpha:0.45];
    CGContextSetStrokeColorWithColor(context, UIColor.blackColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetLineWidth(context, 0.5);
    
    // move to the first point
    CGContextMoveToPoint(context, point.x, point.y);
    // draw line
    CGPoint p1 = CGPointMake(point.x-5, point.y-5);
    CGContextAddLineToPoint(context, p1.x, p1.y);
    CGPoint p2 = CGPointMake(p1.x-10, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGPoint p3 = CGPointMake(p2.x, p2.y-15);
    CGContextAddLineToPoint(context, p3.x, p3.y);
    CGPoint p4 = CGPointMake(p3.x+30, p3.y);
    CGContextAddLineToPoint(context, p4.x, p4.y);
    CGPoint p5 = CGPointMake(p4.x, p4.y+15);
    CGContextAddLineToPoint(context, p5.x, p5.y);
    CGPoint p6 = CGPointMake(p5.x-10, p5.y);
    CGContextAddLineToPoint(context, p6.x, p6.y);
    CGContextAddLineToPoint(context, point.x, point.y);
    
    //渲染
    CGContextDrawPath(context, kCGPathFill);
    
    [self.valueStr drawInRect:CGRectMake(p3.x, p3.y, 30, 20) withAttributes:@{ NSForegroundColorAttributeName: UIColor.whiteColor, NSFontAttributeName: [UIFont systemFontOfSize:10*KScale]}];
}

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)atPoint {
    return CGPointMake(0, 0);
}

- (void)refreshContentWithEntry:(ChartDataEntry * _Nonnull)entry highlight:(ChartHighlight * _Nonnull)highlight {
    self.valueStr = [NSString stringWithFormat:@"%@",@(entry.y)];
}

@end








@interface SimpleChartsView()

@property (strong, nonatomic) NSMutableArray <LineChartDataSet *>* dataSourceArr;
@property (assign, nonatomic) NSInteger startPoint;

@end

@implementation SimpleChartsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = UIColor.whiteColor;
        [self addSubview:self.lineChartView];
    }
    return self;
}

- (LineChartView *)lineChartView{
    if(!_lineChartView){
        _lineChartView = [[LineChartView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height-30*KScale)];
        //背景颜色
        _lineChartView.backgroundColor = UIColor.whiteColor;
        //颜色标注
        _lineChartView.legend.enabled = NO;
        //
        _lineChartView.autoScaleMinMaxEnabled = YES;
        //允许拖动
        _lineChartView.dragEnabled = YES;
        //禁止水平方向缩放
        _lineChartView.scaleXEnabled = NO;
        //禁止竖直方向缩放
        _lineChartView.scaleYEnabled = NO;
        //隐藏图表描述
        _lineChartView.chartDescription.enabled = NO;
        //允许显示数值标注
        _lineChartView.drawMarkers = YES;
        _lineChartView.marker = [[ValueMarkView alloc] init];
        //数据缺省提示内容
        _lineChartView.noDataText = @"暂无数据";
        //显示方格背景
        _lineChartView.drawGridBackgroundEnabled = NO;
        //方格背景颜色
        _lineChartView.gridBackgroundColor = UIColor.whiteColor;
        //显示边界
        _lineChartView.drawBordersEnabled = YES;
        //边界宽度
        _lineChartView.borderLineWidth = 0.5;
        //X轴相关
        _lineChartView.xAxis.drawGridLinesEnabled = YES;
        _lineChartView.xAxis.drawLabelsEnabled = YES;
        _lineChartView.xAxis.labelPosition = XAxisLabelPositionBottom;
        _lineChartView.xAxis.labelCount = 8;
        _lineChartView.xAxis.enabled = YES;
        _lineChartView.xAxis.valueFormatter = [[XAxisValueFormatter alloc] init];
        //Y轴相关
        _lineChartView.leftAxis.drawZeroLineEnabled = NO;
        _lineChartView.leftAxis.drawGridLinesEnabled = YES;
        _lineChartView.leftAxis.drawLimitLinesBehindDataEnabled = YES;
        _lineChartView.leftAxis.labelCount = 6;
        //隐藏右Y轴
        _lineChartView.rightAxis.enabled = NO;
        [_lineChartView animateWithXAxisDuration:1.2];
    }
    return _lineChartView;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

- (void)clearOld{
    //清除数据
    [self.dataSourceArr removeAllObjects];
    [self.lineChartView clear];
}

- (void)showEmptyChart{
    [self clearOld];
    
    self.lineChartView.noDataText = @"暂无数据";
    [self.lineChartView invalidateIntrinsicContentSize];
}

- (void)reloadChart{
    self.lineChartView.data = [[LineChartData alloc] initWithDataSets:self.dataSourceArr];
    [self.lineChartView setNeedsDisplay];
    if (self.startPoint) {
        [self.lineChartView moveViewToX:self.startPoint];
    }
}

- (void)setLeftMax:(NSInteger)value{
    self.lineChartView.leftAxis.axisMaximum = value;
}

- (void)setLeftMin:(NSInteger)value{
    self.lineChartView.leftAxis.axisMinimum = value;
}

- (void)updateAixesWithYMin:(NSInteger)ymin YMax:(NSInteger)ymax XMin:(NSInteger)xmin XMax:(NSInteger)xmax YLimitMax:(NSInteger)limitMax YLimitMin:(NSInteger)limitMin{
    self.lineChartView.leftAxis.axisMinimum = ymin;
    self.lineChartView.leftAxis.axisMaximum = ymax;
    self.lineChartView.xAxis.axisMinimum = xmin;
    self.lineChartView.xAxis.axisMaximum = xmax;
    self.startPoint = xmin;
    
    [self.lineChartView.leftAxis addLimitLine:[self getLimitLineWithValue:limitMin andDescraption:@"最小值"]];
    [self.lineChartView.leftAxis addLimitLine:[self getLimitLineWithValue:limitMax andDescraption:@"最大值"]];
}

- (ChartLimitLine *)getLimitLineWithValue:(NSInteger)value andDescraption:(NSString *)desc{
    ChartLimitLine * limitLine = [[ChartLimitLine alloc] initWithLimit:value label:desc];
    limitLine.lineColor = UIColor.blueColor;
    limitLine.lineDashLengths = @[@(10)];
    return limitLine;
}

- (void)updateWithValues:(NSArray <SimpleChartsDataModel *>*)values forTitle:(NSString *)title andColor:(UIColor *)lineColor{
    NSMutableArray <ChartDataEntry *>* entitys = [NSMutableArray array];
    NSMutableArray * pointColors = [NSMutableArray array];
    [values enumerateObjectsUsingBlock:^(SimpleChartsDataModel * dataModel, NSUInteger idx, BOOL * _Nonnull stop) {
        ChartDataEntry * dataEntity = [[ChartDataEntry alloc] initWithX:dataModel.time y:dataModel.data];
        [entitys addObject:dataEntity];
        [pointColors addObject:dataModel.normal?lineColor:UIColor.redColor];
    }];
    
    [self updateAixesWithYMin:90 YMax:210 XMin:0 XMax:24 YLimitMax:190 YLimitMin:110];
    
    LineChartDataSet * dataSet = [[LineChartDataSet alloc] initWithValues:entitys label:@""];
    dataSet.mode = LineChartModeCubicBezier;
    dataSet.axisDependency = AxisDependencyLeft;
    dataSet.colors = @[lineColor];
    dataSet.lineWidth = 1;
    dataSet.drawCirclesEnabled = YES;
    dataSet.circleColors = pointColors;
    dataSet.circleRadius = 3.0;
    dataSet.drawValuesEnabled = NO;
    dataSet.fillAlpha = 0.26;
    dataSet.fillColor = [UIColor colorWithRed:167/255 green:0/255 blue:1/255 alpha:1];
    dataSet.highlightColor = UIColor.clearColor;
    dataSet.drawCircleHoleEnabled = NO;
    [self.dataSourceArr addObject:dataSet];
    [self reloadChart];
}

@end
