//
//  YYArrangeView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYArrangeView.h"

@implementation YYArrangeView

@synthesize subViewsArr = _subViewsArr;

+ (instancetype)arrangeViewWithFrame:(CGRect)frame andViewsArr:(NSArray *)views{
    YYArrangeView * newView = [[YYArrangeView alloc] initWithFrame:frame];
    newView.subViewsArr = views;
    return newView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (NSArray *)subViewsArr{
    if (!_subViewsArr) {
        _subViewsArr = @[];
    }
    return _subViewsArr;
}

- (void)setSubViewsArr:(NSArray *)subViewsArr{
    //移除可能存在的旧视图
    for (UIView * subView in self.subViewsArr) {
        [subView removeFromSuperview];
    }
    _subViewsArr = nil;
    
    //添加新视图，并重新排布
    if (subViewsArr) {
        _subViewsArr = subViewsArr;
        [self relayoutViews];
    }
}

//子视图排布
- (void)relayoutViews{
    __block CGFloat subTop = 15*KScale;
    __block CGFloat subLeft = 12*KScale;
    __block CGFloat nextTop = 15*KScale;
    
    [self.subViewsArr enumerateObjectsUsingBlock:^(UIView * subView, NSUInteger idx, BOOL * _Nonnull stop) {
        //排除非视图控件的元素
        if ([subView isKindOfClass:[UIView class]] || [subView.class isSubclassOfClass:[UIView class]]) {
            subView.top = subTop;
            subView.left = subLeft;
            subLeft = subView.right+12*KScale;
            nextTop = MAX(nextTop, subView.bottom+9*KScale);
            
            //如果右边界超出范围
            if (subView.right > self.width-12*KScale) {
                //换行
                subTop = nextTop;
                //回车
                subLeft = 12*KScale;
                
                //按换行后的位置
                subView.top = subTop;
                subView.left = subLeft;
                subLeft = subView.right+12*KScale;
                nextTop = MAX(nextTop, subView.bottom+9*KScale);
            }
            
            //加载视图
            [self addSubview:subView];
        }
    }];
    
    //更新自身高度
    self.height = nextTop+6*KScale;
}

@end
