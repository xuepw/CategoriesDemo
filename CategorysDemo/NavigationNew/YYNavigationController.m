//
//  YYNavigationController.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/11.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYNavigationController.h"
#import "UIViewController+YPNviConfigures.h"

@interface YYNavigationController ()

@end

@implementation YYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.navigationBar.barTintColor = [UIColor sy_colorWithString:@"#ffffff" alpha:0.9];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17*KScale]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count >= 1) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(popView)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popView{
    [self popViewControllerAnimated:YES];
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
