//
//  YYLineGraphView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUChart.h"

@interface YYLineGraphView : UIView

//数据组
@property (strong, nonatomic) NSMutableArray<NSArray *>* valuesArr;
//颜色组(需要保证颜色组Count与数据组Count一致)
@property (strong, nonatomic) NSMutableArray * colorsArr;
//X轴数组
@property (strong, nonatomic) NSMutableArray * xTitlesArr;
//Y轴范围
@property (assign, nonatomic) CGRange rangeY;
//显示水平、垂直线
@property (assign, nonatomic) BOOL showHorizonLines;
@property (assign, nonatomic) BOOL showVerticalLines;
//显示水平、垂直标签
@property (assign, nonatomic) BOOL showHorizonTitle;
@property (assign, nonatomic) BOOL showVerticalTitle;


//重新加载数据
- (void)reloadData;

@end
