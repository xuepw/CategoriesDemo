//
//  YYChartsBarView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/5/30.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "CategorysDemo-Bridging-Header.h"
#import <UIKit/UIKit.h>
#import "SimpleChartsDataModel.h"

@interface YYChartsBarView : UIView

- (void)clearOld;
- (void)reloadChart;
- (void)updateWithValues:(NSArray <SimpleChartsDataModel *>*)values forTitle:(NSString *)title andColor:(UIColor *)barColor;

@end
