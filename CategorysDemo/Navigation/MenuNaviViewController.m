//
//  MenuNaviViewController.m
//  YYChildren
//
//  Created by Yiyang_zyq on 2017/3/15.
//  Copyright © 2017年 Yiyang_zyq. All rights reserved.
//

#import "MenuNaviViewController.h"

@interface MenuNaviViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation MenuNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.9];
    
    //隐藏黑线
    UIImageView *lineImage = [self fineTheLineBelowNavigationBar:self.navigationBar];
    lineImage.hidden = NO;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor sy_colorWithString:@"#333333"],NSFontAttributeName:[UIFont systemFontOfSize:17*KScale]}];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count >= 1) {
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        
    }
    
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)popView{
    [self popViewControllerAnimated:YES];
}

//手势代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

- (void)dealloc{
    self.delegate = nil;
    //DBLog(@"MenuNavigationVC   --dealloc");
}

#pragma mark ----------隐藏导航条黑线--------------------

-(UIImageView * )fineTheLineBelowNavigationBar:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]] && view.frame.size.height <=1.0) {
        return (UIImageView *)view;
    }
    for (UIView * sub in view.subviews) {
        UIImageView * image = [self fineTheLineBelowNavigationBar:sub];
        if (image) {
            return  image;
        }
    }
    return  nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
