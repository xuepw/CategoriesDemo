//
//  UIView+Addition.h
//  Vaccine
//
//  Created by Tonny on 7/30/13.
//  Copyright (c) 2013 DoouYa All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

//获取某个类的子级视图
- (UIView*)descendantOrSelfWithClass:(Class)cls;
//获取某个类的父级视图
- (id)superviewWithClass:(Class)viewClass;

/**
 通过视图编号获取子视图
 
 @param tag 子视图编号
 @return 获取到的视图
 */
- (id)subviewWithTag:(NSInteger)tag;

/**
 获取视图所在的控制器
 
 @return 视图所在的控制器
 */
- (UIViewController*)viewController;

/**
 获取所在Cell的IndexPath
 
 @param tableView 所在的UITableView
 @return IndexPath  为nil时，表示不在TableView上
 */
- (NSIndexPath *)indexPathInTableView:(UITableView *)tableView;

/**
 显示边框
 
 @param color        边框颜色
 @param borderWidth  边框宽度
 @param cornerradius 圆角半径
 */
- (void)showBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerradius;

/**
 显示底部线条
 
 @param left      线条起点
 @param length    线条长度
 @param color     线条颜色
 @param height    线条宽度
 */
- (void)addBottomLineFormLeft:(CGFloat)left length:(CGFloat)length withColor:(UIColor *)color andHeight:(CGFloat)height;

@end
