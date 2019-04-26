//
//  SimpleChartPieView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/7/30.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "CategorysDemo-Bridging-Header.h"
#import "SimpleChartPieView.h"
#import "ChartDataEntry+Addation.h"

@implementation PieDataValueFormate

- (NSString *)stringForValue:(double)value entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler *)viewPortHandler{
    return [NSString stringWithFormat:@"%@\n%.f人(%.2f%%)",entry.valueName,entry.valueNumb,value];
}

@end

@interface SimpleChartPieView()

@property (strong, nonatomic) PieChartView * pieView;
@property (strong, nonatomic) NSMutableArray * dataSourceArr;

@end

@implementation SimpleChartPieView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.pieView];
    }
    return self;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

- (PieChartView *)pieView{
    if (!_pieView) {
        _pieView = [[PieChartView alloc] initWithFrame:CGRectMake(0, 0, self.height, self.height)];
        _pieView.backgroundColor = [UIColor sy_backgroundColor];
        //是否根据所提供的数据, 将显示数据转换为百分比格式
        _pieView.usePercentValuesEnabled = YES;
        //拖拽饼状图后是否有惯性效果
        _pieView.dragDecelerationEnabled = YES;
        //饼状图距离边缘的间隙
        [_pieView setExtraOffsetsWithLeft:42*KScale top:42*KScale right:42*KScale bottom:42*KScale];
        
        //饼状图是否是空心
        _pieView.drawHoleEnabled = YES;
        //空心半径占比
        _pieView.holeRadiusPercent = 0.744;
        //空心颜色
        _pieView.holeColor = [UIColor clearColor];
        //半透明空心半径占比
        _pieView.transparentCircleRadiusPercent = 0;
        //半透明空心的颜色
        _pieView.transparentCircleColor = [UIColor sy_colorWithString:@"#E58156" alpha:0.32];
        
        //描述字符串
        _pieView.chartDescription.text = @"";
        //不显示图例
        _pieView.legend.maxSizePercent = 0;
        _pieView.legend.formSize = 0;
    }
    return _pieView;
}

//显示圆心文本
- (void)showCenterText{
    if (_pieView.isDrawHoleEnabled == YES) {
        //是否显示中间文字
        _pieView.drawCenterTextEnabled = YES;
        //普通文本
        //self.pieChartView.centerText = @"饼状图";//中间文字
        //富文本
        NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"饼状图"];
        [centerText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                    NSForegroundColorAttributeName: [UIColor orangeColor]}
                            range:NSMakeRange(0, centerText.length)];
        _pieView.centerAttributedText = centerText;
    }
}

//显示图例
- (void)showLegend{
    _pieView.legend.maxSizePercent = 0;//图例在饼状图中的大小占比, 这会影响图例的宽高
    _pieView.legend.formToTextSpace = 5;//文本间隔
    _pieView.legend.font = [UIFont systemFontOfSize:10];//字体大小
    _pieView.legend.textColor = [UIColor grayColor];//字体颜色
    _pieView.legend.form = ChartLegendFormCircle;//图示样式: 方形、线条、圆形
    _pieView.legend.formSize = 0;//图示大小
}

#pragma mark ----------数据加载----------
- (void)clearOld{
    //清除数据
    [self.dataSourceArr removeAllObjects];
    [self.pieView clear];
}

- (void)showEmptyChart{
    [self clearOld];
    
    self.pieView.noDataText = @"暂无数据";
    [self.pieView invalidateIntrinsicContentSize];
}

- (void)updateWithValues:(NSArray <NSNumber*>*)values names:(NSArray <NSString*>*)names colors:(NSArray <UIColor*>*)colors{
    //每个区块的数据
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (NSInteger idx = 0; idx < names.count; idx++) {
        double y = 0;
        if (idx < values.count) {
            y = [values[idx] integerValue];
        }
        PieChartDataEntry *entry = [[PieChartDataEntry alloc] initWithValue:y];
        entry.valueName = names[idx];
        entry.valueNumb = y;
        [yVals addObject:entry];
    }
    
    //dataSet
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:yVals label:@""];
    dataSet.drawValuesEnabled = YES;//是否绘制显示数据
    dataSet.colors = colors;//区块颜色
    dataSet.sliceSpace = 0;//相邻区块之间的间距
    dataSet.selectionShift = 8;//选中区块时, 放大的半径
    dataSet.xValuePosition = PieChartValuePositionInsideSlice;//名称位置
    dataSet.yValuePosition = PieChartValuePositionOutsideSlice;//数据位置
    //数据与区块之间的用于指示的折线样式
    //折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
    dataSet.valueLinePart1OffsetPercentage = 0.85;
    dataSet.valueLinePart1Length = 0.5;//折线中第一段长度占比
    dataSet.valueLinePart2Length = 0.4;//折线中第二段长度最大占比
    dataSet.valueLineWidth = 1;        //折线的粗细
    dataSet.valueLineColor = colors[0];//折线颜色
    
    //data
    PieChartData * data = [[PieChartData alloc] initWithDataSets:@[dataSet]];
    PieDataValueFormate * formatter = [[PieDataValueFormate alloc] init];
    [data setValueFormatter:formatter];//设置显示数据格式
    [data setValueTextColor:colors[0]];
    [data setValueFont:[UIFont systemFontOfSize:12*KScale]];
    
    self.pieView.data = data;
    [self.pieView setNeedsDisplay];
}

@end
