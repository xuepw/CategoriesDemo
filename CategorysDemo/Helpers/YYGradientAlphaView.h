//
//  YYGradientAlphaView.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/2.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

///渐变色视图
@interface YYGradientAlphaView : UIView

/*
 初始化渐变色UIView
 
 @param frame            初始Frame
 @param leftcolor        左侧颜色
 @param rightcolor       右侧颜色
 @return 初始化获得的渐变色UIView
 */
- (instancetype)initWithFrame:(CGRect)frame leftColor:(UIColor *)leftcolor rightColor:(UIColor *)rightcolor;

/*
 初始化渐变色UIView
 
 @param frame            初始Frame
 @param topcolor         顶部颜色
 @param botcolor         底部颜色
 @return 初始化获得的渐变色UIView
 */
- (instancetype)initWithFrame:(CGRect)frame topColor:(UIColor *)topcolor bottomColor:(UIColor *)botcolor;

/*
 获得渐变色Image
 
 @param frame            初始Frame
 @param colors        	 颜色数组，
 @return 渐变色图片
 */
+ (UIImage *)gradientImgFromColors:(NSArray<UIColor *>*)colors withFrame:(CGRect)frame;

/*
 在图片上添加文字
 
 @param text              要添加的文字
 @param image             要添加文字的图片
 @return 添加文字的图片
 */
+ (UIImage *)addText:(NSString*)text toImage:(UIImage*)image;

@end
