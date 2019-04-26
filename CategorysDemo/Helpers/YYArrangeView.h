//
//  YYArrangeView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

///多视图自左至右、自上到下排列视图容器
@interface YYArrangeView : UIView

//需要布局的视图数组
@property (strong, nonatomic) NSArray<UIView *>* subViewsArr;

/*
 初始化方法
 
 @param fram      初始Frame
 @param views     需要布局的视图数组
 @return          容器视图
 */
+ (instancetype)arrangeViewWithFrame:(CGRect)frame andViewsArr:(NSArray<UIView *>*)views;

//重新布局子视图
- (void)relayoutViews;

@end
