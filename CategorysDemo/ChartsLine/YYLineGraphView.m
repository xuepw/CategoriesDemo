//
//  YYLineGraphView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYLineGraphView.h"

@interface YYLineGraphView()<UUChartDataSource>

@property (strong, nonatomic) UUChart * chartView;

@end

@implementation YYLineGraphView{
    NSArray * defaultColors;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UUChart *)chartView{
    if (!_chartView) {
        _chartView = [[UUChart alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) dataSource:self style:UUChartStyleLine];
        [_chartView showInView:self];
    }
    return _chartView;
}

- (NSMutableArray *)valuesArr{
    if (!_valuesArr) {
        _valuesArr = [NSMutableArray arrayWithObject:@[]];
    }
    return _valuesArr;
}

- (NSMutableArray *)xTitlesArr{
    if (!_xTitlesArr) {
        _xTitlesArr = [NSMutableArray array];
    }
    return _xTitlesArr;
}

- (NSMutableArray *)colorsArr{
    if (!_colorsArr) {
        _colorsArr = [NSMutableArray array];
    }
    return _colorsArr;
}

- (CGRange)rangeY{
    if (_rangeY.max == 0 && _rangeY.min == 0) {
        _rangeY.max = 100;
    }
    return _rangeY;
}

//刷新数据
- (void)reloadData{
    
    
    [self.chartView strokeChart];
}

#pragma mark --------折线图代理--------
//横坐标分割数量
- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart{
    return self.xTitlesArr;
}

//数值多重数组，
- (NSArray *)chartConfigAxisYValue:(UUChart *)chart{
    return self.valuesArr;
}

//y轴取值范围
- (CGRange)chartRange:(UUChart *)chart{
    return self.rangeY;
}

#pragma mark ----------可选方法-------------

//是否显示横线
- (BOOL)chart:(UUChart *)chart showHorizonLineAtIndex:(NSInteger)index{
    return self.showHorizonLines;
}

//返回NO会默认画一条y轴
- (BOOL)chart:(UUChart *)chart showVerticalLineAtIndex:(NSInteger)index{
    return self.showVerticalLines;
}

//返回颜色数组,颜色数量与上面的多重数组数量一致
- (NSArray *)chartConfigColors:(UUChart *)chart{
    return self.colorsArr;
}

//是否显示y轴Label
- (BOOL)isShowYLabel{
    return self.showHorizonTitle;
}

//是否显示x轴Label，X轴Label最多展示12个
- (BOOL)isShowXLabel{
    return self.showVerticalTitle;
}

@end
