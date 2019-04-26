//
//  BigImageCell.h
//  CategorysDemo
//
//  Created by eyoung on 2018/8/16.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UITableViewCell

- (void)loadBigImage;
- (void)removeBigImage;
- (void)updateImgWithTop:(CGFloat)top;

@end
