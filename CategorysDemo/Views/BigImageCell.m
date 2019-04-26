//
//  BigImageCell.m
//  CategorysDemo
//
//  Created by eyoung on 2018/8/16.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "BigImageCell.h"

@interface BigImageCell()

@property (strong, nonatomic) UIScrollView * imgContentView;
@property (strong, nonatomic) UIImageView * bigImgView;

@end

@implementation BigImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

- (UIScrollView *)imgContentView{
    if (!_imgContentView) {
        _imgContentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, self.height)];
        _imgContentView.scrollEnabled = NO;
    }
    return _imgContentView;
}

- (UIImageView *)bigImgView{
    if(!_bigImgView){
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"lakeside_sunset" ofType:@"png"];
        _bigImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, self.height)];
        _bigImgView.image = [UIImage imageWithContentsOfFile:imagePath];
        [self.imgContentView addSubview:_bigImgView];
    }
    return _bigImgView;
}

- (void)loadBigImage{
    self.bigImgView.height = self.superview.height;
    self.imgContentView.height = self.height;
    self.imgContentView.contentSize = self.bigImgView.size;
    [self addSubview:self.imgContentView];
}

- (void)removeBigImage{
    [self.imgContentView removeFromSuperview];
}

- (void)updateImgWithTop:(CGFloat)top{
    CGRect visibleRect = CGRectMake(0, top, self.imgContentView.width, self.height);
    [self.imgContentView scrollRectToVisible:visibleRect animated:NO];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
