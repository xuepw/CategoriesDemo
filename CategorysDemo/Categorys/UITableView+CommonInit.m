//
//  UITableView+CommonInit.m
//  CategorysDemo
//
//  Created by eyoung on 2018/3/31.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "UITableView+CommonInit.h"
#import <objc/runtime.h>

static const void *ShowEmptyViewKey = &ShowEmptyViewKey;

@implementation UITableView (CommonInit)

//初始化
+ (instancetype)tableViewWithFrame:(CGRect)frame delegate:(id<UITableViewDelegate, UITableViewDataSource>)datadelete nodataDelegate:(id<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>)nodataDelegate refreshTarget:(id)fresher refreshAction:(SEL)fresh loadMoreAction:(SEL)loadmore{
    UITableView * newTableView = [[UITableView alloc] initWithFrame:frame];
    if (datadelete) {
        newTableView.delegate = datadelete;
        newTableView.dataSource = datadelete;
    }
    if (nodataDelegate) {
        newTableView.emptyDataSetSource = nodataDelegate;
        newTableView.emptyDataSetDelegate = nodataDelegate;
        newTableView.showEmptyView = YES;
    }
    if (fresher && [fresher respondsToSelector:fresh]) {
        MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:fresher refreshingAction:fresh];
        header.lastUpdatedTimeLabel.hidden = YES;
        [header setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
        [header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
        [header setTitle:@"正在刷新数据..." forState:MJRefreshStateRefreshing];
        [newTableView setMj_header:header];
    }
    if (fresher && [fresher respondsToSelector:loadmore]) {
        MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:fresher refreshingAction:loadmore];
        [footer setTitle:@"没有更多数据了哦" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"" forState:MJRefreshStateIdle];
        [newTableView setMj_footer:footer];
    }
    return newTableView;
}

+ (instancetype)tableViewWithFrame:(CGRect)frame
                             style:(UITableViewStyle)style
                    separatorStyle:(UITableViewCellSeparatorStyle)separatorstyle{
    UITableView * newTableView = [[UITableView alloc] initWithFrame:frame style:style];
    newTableView.separatorStyle = separatorstyle;
    
    //
    if (style == UITableViewStyleGrouped) {
        newTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 0.1)];
        newTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 0.1)];
    }
    return newTableView;
}

- (BOOL)showEmptyView{
    return [objc_getAssociatedObject(self, ShowEmptyViewKey) boolValue];
}

- (void)setShowEmptyView:(BOOL)showEmptyView{
    objc_setAssociatedObject(self, ShowEmptyViewKey, @(showEmptyView), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (showEmptyView) {
        if (self.emptyDataSetDelegate == nil) {
            self.emptyDataSetDelegate = self;
            self.emptyDataSetSource = self;
        }
    } else {
        self.emptyDataSetDelegate = nil;
        self.emptyDataSetSource = nil;
    }
}

#pragma mark --------数据缺省视图代理--------
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"img_nodata"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"暂无数据";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:15*KScale],
                                 NSForegroundColorAttributeName: [UIColor sy_colorWithString:@"#333333"]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.scrollEnabled?@"下拉列表刷新数据":@"点击刷新数据";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:13*KScale],
                                 NSForegroundColorAttributeName: [UIColor sy_colorWithString:@"#666666"],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return self.scrollEnabled;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView{
    return !self.scrollEnabled;
}

@end
