//
//  MasonryController.m
//  CategorysDemo
//
//  Created by eyoung on 2019/4/2.
//  Copyright © 2019年 eyoung. All rights reserved.
//

#import "MasonryController.h"

@interface MasonryController ()
    
@property (strong, nonatomic) UIScrollView * contentView;
@property (strong, nonatomic) NSMutableArray * viewsArr;

@end

@implementation MasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Masonry";
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.contentView];
    
}
    
- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, Kwidth, Kheight-SafeAreaTopHeight)];
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
    }
    return _contentView;
}
    
- (NSMutableArray *)viewsArr{
    if (!_viewsArr) {
        _viewsArr = [NSMutableArray array];
    }
    return _viewsArr;
}
    
- (void)setupMasonryLayout{
    [self.contentView removeConstraints:self.contentView.constraints];
    
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
