//
//  SimpleChartsView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/5/21.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "CategorysDemo-Bridging-Header.h"
#import <UIKit/UIKit.h>
#import "SimpleChartsDataModel.h"

@interface XAxisValueFormatter : NSObject <IChartAxisValueFormatter>

@end

@interface ValueMarkView : UIView <IChartMarker>

@end

@interface SimpleChartsView : UIView

@property (strong, nonatomic) LineChartView * lineChartView;

- (void)clearOld;
- (void)reloadChart;
- (void)updateAixesWithYMin:(NSInteger)ymin YMax:(NSInteger)ymax XMin:(NSInteger)xmin XMax:(NSInteger)xmax YLimitMax:(NSInteger)limitMax YLimitMin:(NSInteger)limitMin;
- (void)updateWithValues:(NSArray <SimpleChartsDataModel *>*)values forTitle:(NSString *)title andColor:(UIColor *)lineColor;

@end
