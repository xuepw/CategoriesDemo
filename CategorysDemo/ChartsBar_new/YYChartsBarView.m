//
//  YYChartsBarView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/30.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYChartsBarView.h"
#import "SimpleChartsView.h"

@interface YYChartsBarView()

@property (nonatomic, strong) BarChartView *chartView;
@property (nonatomic, strong) NSMutableArray * dataSourceArr;

@end

@implementation YYChartsBarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.chartView];
    }
    return self;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

- (BarChartView *)chartView{
    if (!_chartView) {
        _chartView = [[BarChartView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _chartView.backgroundColor = UIColor.whiteColor;
        //禁止用户操作响应
        _chartView.userInteractionEnabled = NO;
        //数据缺省
        _chartView.noDataText = @"暂无数据";
        //置为YES，使左右两边的Bar显示完整
        _chartView.fitBars = YES;
        //不显示颜色标签
        _chartView.legend.enabled = NO;
        //Y轴范围自适应
        _chartView.autoScaleMinMaxEnabled = YES;
        //不允许拖动
        _chartView.dragEnabled = NO;
        //不允许左右上下缩放
        _chartView.scaleXEnabled = NO;
        _chartView.scaleYEnabled = NO;
        //不显示图标描述
        _chartView.chartDescription.enabled = NO;
        //描绘边框
        _chartView.drawBordersEnabled = YES;
        //边框宽度
        _chartView.borderLineWidth = 0.5;
        //不显示背景
        _chartView.drawGridBackgroundEnabled = NO;
        //背景颜色
        _chartView.gridBackgroundColor = UIColor.whiteColor;
        //隐藏右Y轴
        _chartView.rightAxis.enabled = NO;
        
        //X轴相关设置
        _chartView.xAxis.valueFormatter = [[XAxisValueFormatter alloc] init];
        _chartView.xAxis.labelPosition = XAxisLabelPositionBottom;
        _chartView.xAxis.drawGridLinesEnabled = NO;
        _chartView.xAxis.drawAxisLineEnabled = YES;
        
        //Y轴相关设置
        _chartView.leftAxis.drawZeroLineEnabled = YES;
        _chartView.leftAxis.drawGridLinesEnabled = YES;
        _chartView.leftAxis.drawLimitLinesBehindDataEnabled = YES;
        _chartView.leftAxis.labelCount = 6;
        
        [_chartView animateWithYAxisDuration:1.0];
    }
    return _chartView;
}

- (void)clearOld{
    //移除颜色标记
//    for (YYChartColorView * markView in self.colorViewsArr) {
//        [markView removeFromSuperview];
//    }
//    [self.colorViewsArr removeAllObjects];
//    self.colorsView.contentSize = self.colorsView.size;
    
    //清除数据
    [self.dataSourceArr removeAllObjects];
    [self.chartView clear];
}

- (void)reloadChart{
    BarChartData *data = [[BarChartData alloc] initWithDataSets:self.dataSourceArr];
    
    self.chartView.data = data;
    [self.chartView setNeedsDisplay];
}

- (void)updateWithValues:(NSArray <SimpleChartsDataModel *>*)values forTitle:(NSString *)title andColor:(UIColor *)barColor{
    NSMutableArray *entries = [NSMutableArray array];
    for (int i = 0; i<values.count; i++) {
        SimpleChartsDataModel * datamodel = values[i];
        BarChartDataEntry *barEntry = [[BarChartDataEntry alloc] initWithX:i y:datamodel.data icon:nil];
        [entries addObject:barEntry];
    }
    BarChartDataSet *set = [[BarChartDataSet alloc] initWithValues:entries label:title];
    set.drawValuesEnabled = NO;
    set.drawIconsEnabled = NO;
    set.colors = @[barColor];
    
    [self.dataSourceArr addObject:set];
    [self reloadChart];
}


@end
