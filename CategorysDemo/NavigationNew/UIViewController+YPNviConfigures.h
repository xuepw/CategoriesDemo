//
//  UIViewController+YPNviConfigures.h
//  CategorysDemo
//
//  Created by eyoung on 2018/5/11.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

@interface UIViewController (YPNviConfigures)<YPNavigationBarConfigureStyle>

@property (nonatomic, assign) YPNavigationBarConfigurations configurations;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, copy)  NSString *backgroundImageName;

- (void)setNaviBottomLineHidden:(BOOL)hidden;

@end
