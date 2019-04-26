//
//  YYPopView.m
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//
#define yy_AnimateDuration 0.25

#import "YYPopView.h"

@interface YYPopView()

@property (strong, nonatomic) UIView * tapView;

@end

@implementation YYPopView

+ (instancetype)yy_popViewType:(YYPopViewType)type withView:(UIView *)contentView{
    YYPopView * newpopView = [[YYPopView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
    newpopView.type = type;
    if (contentView) {
        [newpopView.contentView removeFromSuperview];
        [newpopView setContentView:contentView];
        [newpopView addSubview:contentView];
    }
    return newpopView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.45];
        [self addSubview:self.tapView];
    }
    return self;
}

- (UIView *)tapView{
    if (!_tapView) {
        //点击回收视图
        UITapGestureRecognizer * bgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        _tapView = [[UIView alloc] initWithFrame:self.frame];
        _tapView.backgroundColor = [UIColor clearColor];
        [_tapView addGestureRecognizer:bgtap];
    }
    return _tapView;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 6*KScale;
    }
    return _contentView;
}

- (void)show{
    UIWindow * keyWindow = [[UIApplication sharedApplication] keyWindow];
    switch (self.type) {
        case YYPopViewTypeCenter:{
            self.alpha = 0;
            self.contentView.center = CGPointMake(Kwidth/2, Kheight/2);
            [keyWindow addSubview:self];
            [UIView animateWithDuration:yy_AnimateDuration animations:^{
                self.alpha = 1;
            }];
        }
            break;
        case YYPopViewTypeBottom:{
            self.backgroundColor = [UIColor clearColor];
            self.contentView.top = Kheight;
            [keyWindow addSubview:self];
            [UIView animateWithDuration:yy_AnimateDuration animations:^{
                self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.45];
                self.contentView.top = Kheight-self.contentView.height;
            }];
        }
            break;
        default:
            break;
    }
}

- (void)dismiss{
    switch (self.type) {
        case YYPopViewTypeCenter:{
            [UIView animateWithDuration:yy_AnimateDuration animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case YYPopViewTypeBottom:{
            [UIView animateWithDuration:yy_AnimateDuration animations:^{
                self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
                self.contentView.top = Kheight;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        default:
            break;
    }
}

@end
