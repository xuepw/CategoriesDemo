//
//  CircleView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/5/14.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property(assign,nonatomic)CGFloat startValue;
@property(assign,nonatomic)CGFloat lineWidth;
@property(assign,nonatomic)CGFloat value;
@property(strong,nonatomic)UIColor *lineColor;
@property(strong,nonatomic)UIColor *backColor;

@end  
