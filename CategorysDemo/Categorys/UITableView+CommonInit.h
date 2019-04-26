//
//  UITableView+CommonInit.h
//  CategorysDemo
//
//  Created by eyoung on 2018/3/31.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <MJRefresh/MJRefresh.h>
#import <UIKit/UIKit.h>


@interface UITableView (CommonInit)<DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

//显示或隐藏默认的数据缺省视图
@property (nonatomic) BOOL showEmptyView;

/*
 UITableView 初始化，带缺省视图和自动刷新
 
 @param frame            TableView的初始Frame
 @param datadelete       代理和数据源
 @param nodataDelegate   缺省视图的代理和数据源
 @param fresher          下拉刷新的实现者，如果传入nil，将不实现下拉刷新
 @param fresh            下拉刷新的方法
 @param loadmore         上拉加载的方法
 @return 初始化获得的TableView
 */
+ (instancetype)tableViewWithFrame:(CGRect)frame
                          delegate:(id<UITableViewDelegate, UITableViewDataSource>)datadelete
                    nodataDelegate:(id<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>)nodataDelegate
                     refreshTarget:(id)fresher
                     refreshAction:(SEL)fresh
                    loadMoreAction:(SEL)loadmore;

/*
 UITableView 初始化，普通常用属性
 
 @param frame            TableView的初始Frame
 @param style            TableView的Style
 @param separatorstyle   数据条间隔线Style
 @return 初始化获得的TableView
 */
+ (instancetype)tableViewWithFrame:(CGRect)frame
                             style:(UITableViewStyle)style
                    separatorStyle:(UITableViewCellSeparatorStyle)separatorstyle;

@end
