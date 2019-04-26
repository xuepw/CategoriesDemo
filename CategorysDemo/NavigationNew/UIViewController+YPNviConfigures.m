//
//  UIViewController+YPNviConfigures.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/11.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "UIViewController+YPNviConfigures.h"
#import <objc/runtime.h>

NSString const *configurationsKey                 = @"configurationsKey";
NSString const *tintColorKey                      = @"tintColorKey";
NSString const *backgroundColorKey                = @"backgroundColorKey";
NSString const *backgroundImageKey                = @"backgroundImageKey";
NSString const *backgroundImageNameKey            = @"backgroundImageNameKey";

@implementation UIViewController (YPNviConfigures)

#pragma mark - getters/setters
- (YPNavigationBarConfigurations)configurations{
    NSNumber * temp = objc_getAssociatedObject(self, &configurationsKey);
    return temp.integerValue;
}

- (void)setConfigurations:(YPNavigationBarConfigurations)configurations{
    NSNumber * temp = @(configurations);
    objc_setAssociatedObject(self, &configurationsKey, temp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)tintColor{
    return objc_getAssociatedObject(self, &tintColorKey);
}

- (void)setTintColor:(UIColor *)tintColor{
    objc_setAssociatedObject(self, &tintColorKey, tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)backgroundColor{
    return objc_getAssociatedObject(self, &backgroundColorKey);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    objc_setAssociatedObject(self, &backgroundColor, backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)backgroundImage{
    return objc_getAssociatedObject(self, &backgroundImageKey);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    objc_setAssociatedObject(self, &backgroundImageKey, backgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)backgroundImageName{
    return objc_getAssociatedObject(self, &backgroundImageNameKey);
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName{
    objc_setAssociatedObject(self, &backgroundImageNameKey, backgroundImageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark -----------Methods----------
- (void)setNaviBottomLineHidden:(BOOL)hidden{
    UIView * lineView = [self.view subviewWithTag:101];
    if (!lineView) {
        lineView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight-10, Kwidth, 10)];
        lineView.tag = 101;
        lineView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:lineView];
    }
    lineView.hidden = hidden;
}

#pragma mark - YPNavigationBarConfigureStyle

- (YPNavigationBarConfigurations) yp_navigtionBarConfiguration {
    return self.configurations;
}

- (UIColor *) yp_navigationBarTintColor {
    return self.tintColor;
}

- (UIColor *) yp_navigationBackgroundColor {
    return self.backgroundColor;
}

- (UIImage *) yp_navigationBackgroundImageWithIdentifier:(NSString *__autoreleasing *)identifier {
    if (identifier) *identifier = self.backgroundImageName;
    return self.backgroundImage;
}

@end
