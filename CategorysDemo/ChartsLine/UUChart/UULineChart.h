//
//  UULineChart.h
//  UUChartDemo
//
//  Created by shake on 14-7-24.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UUChartConst.h"

@interface UULineChart : UIView

@property (strong, nonatomic) NSArray * xLabels;
@property (strong, nonatomic) NSArray * yLabels;
@property (strong, nonatomic) NSArray * yValues;
@property (strong, nonatomic) NSArray * colors;

@property (strong, nonatomic) NSMutableArray *showHorizonLine;//水平线
@property (strong, nonatomic) NSMutableArray *showMaxMinArray;

@property (nonatomic) CGFloat xLabelWidth;
@property (nonatomic) CGFloat yValueMin;
@property (nonatomic) CGFloat yValueMax;

@property (nonatomic, assign) CGRange markRange;

@property (nonatomic, assign) CGRange chooseRange;

@property (nonatomic) BOOL showYlabel;
@property (nonatomic) BOOL showXlabel;
@property ( nonatomic)BOOL showverticalLine;//竖直线


-(void)strokeChart;

- (NSArray *)chartLabelsForX;

@end
