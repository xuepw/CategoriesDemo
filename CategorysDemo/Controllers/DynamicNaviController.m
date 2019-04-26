//
//  DynamicNaviController.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/12.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "DynamicNaviController.h"
#import "YYNavigationLabel.h"

@interface DynamicNaviController ()<UIScrollViewDelegate>

@property (strong, nonatomic) YYNavigationLabel * titleLbl;
@property (strong, nonatomic) UIScrollView * contentView;
@property (nonatomic, strong) UIImageView *headerImgView;

@end

@implementation DynamicNaviController{
    CGFloat _gradientProgress;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"DynamicVC";
    self.view.backgroundColor = UIColor.whiteColor;
    self.extendedLayoutIncludesOpaqueBars = YES;
    //self.navigationItem.titleView = self.titleLbl;
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.headerImgView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    UIImage *headerImage = self.headerImgView.image;
    CGFloat imageHeight = headerImage.size.height / headerImage.size.width * KScale;
    CGRect headerFrame = self.headerImgView.frame;
    
    if (self.contentView.contentInset.top == 0) {
        UIEdgeInsets inset = UIEdgeInsetsZero;
        if (@available(iOS 11,*)) {
            inset.bottom = self.view.safeAreaInsets.bottom;
        }
        self.contentView.scrollIndicatorInsets = inset;
        inset.top = imageHeight;
        self.contentView.contentInset = inset;
        self.contentView.contentOffset = CGPointMake(0, -inset.top);
    }
    
    if (CGRectGetHeight(headerFrame) != imageHeight) {
        self.headerImgView.frame = [self headerImageFrame];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (YYNavigationLabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[YYNavigationLabel alloc] init];
        _titleLbl.textColor = UIColor.clearColor;
        _titleLbl.text = self.title;
    }
    return _titleLbl;
}

- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _contentView.backgroundColor = UIColor.orangeColor;
        _contentView.contentSize = CGSizeMake(_contentView.width, _contentView.height*2);
        _contentView.delegate = self;
        
        if (@available(iOS 11,*)) {
            _contentView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _contentView;
}

- (UIImageView *)headerImgView{
    if (!_headerImgView) {
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"lakeside_sunset" ofType:@"png"];
        UIImage *headerImage = [UIImage imageWithContentsOfFile:imagePath];
        _headerImgView = [[UIImageView alloc] initWithImage:headerImage];
        _headerImgView.clipsToBounds = YES;
        _headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headerImgView;
}

- (CGRect) headerImageFrame {
    UIImage *headerImage = self.headerImgView.image;
    CGFloat imageHeight = headerImage.size.height / headerImage.size.width * Kwidth;
    
    CGFloat contentOffsetY = self.contentView.contentOffset.y + self.contentView.contentInset.top;
    if (contentOffsetY < 0) {
        imageHeight += -contentOffsetY;
    }
    
    CGRect headerFrame = self.view.bounds;
    if (contentOffsetY > 0) {
        headerFrame.origin.y -= contentOffsetY;
    }
    headerFrame.size.height = imageHeight;
    
    return headerFrame;
}

#pragma mark -----------ScrollViewDelegate-----------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat headerHeight = CGRectGetHeight(self.headerImgView.frame);
    if (@available(iOS 11,*)) {
        headerHeight -= self.view.safeAreaInsets.top;
    } else {
        headerHeight -= [self.topLayoutGuide length];
    }
    
    CGFloat progress = scrollView.contentOffset.y + scrollView.contentInset.top;
    CGFloat gradientProgress = MIN(1, MAX(0, progress  / headerHeight));
    gradientProgress = gradientProgress * gradientProgress * gradientProgress * gradientProgress;
    if (gradientProgress != _gradientProgress) {
        _gradientProgress = gradientProgress;
        self.titleLbl.textColor = _gradientProgress == 1 ? [self yp_navigationBarTintColor] : [UIColor clearColor];
        [self yp_refreshNavigationBarStyle];
    }
    
    self.headerImgView.frame = [self headerImageFrame];
}

#pragma mark -----------YPNavigationBarConfigureStyle----------
- (YPNavigationBarConfigurations) yp_navigtionBarConfiguration {
    YPNavigationBarConfigurations configurations = YPNavigationBarShow;
    if (_gradientProgress < 0.5) {
        configurations |= YPNavigationBarStyleBlack;
    }
    
    if (_gradientProgress == 1) {
        configurations |= YPNavigationBarBackgroundStyleOpaque;
    }
    
    configurations |= YPNavigationBarBackgroundStyleColor;
    return configurations;
}

- (UIColor *) yp_navigationBarTintColor {
    return [UIColor colorWithWhite:1 - _gradientProgress alpha:1];
}

- (UIColor *) yp_navigationBackgroundColor {
    return [UIColor colorWithWhite:1 alpha:_gradientProgress];
}

@end
