//
//  YYPopView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YYPopViewTypeCenter,
    YYPopViewTypeBottom,
} YYPopViewType;

//弹出框视图
@interface YYPopView : UIView

@property (assign, nonatomic) YYPopViewType type;
@property (strong, nonatomic) UIView * contentView;

+ (instancetype)yy_popViewType:(YYPopViewType)type withView:(UIView *)contentView;
- (void)show;
- (void)dismiss;

@end
