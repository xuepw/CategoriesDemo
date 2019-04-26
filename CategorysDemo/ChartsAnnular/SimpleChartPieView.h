//
//  SimpleChartPieView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/7/30.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieDataValueFormate : NSObject<IChartValueFormatter>

@end

@interface SimpleChartPieView : UIView

- (void)updateWithValues:(NSArray <NSNumber*>*)values names:(NSArray <NSString*>*)names colors:(NSArray <UIColor*>*)colors;
- (void)clearOld;

@end
