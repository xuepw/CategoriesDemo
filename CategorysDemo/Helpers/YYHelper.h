//
//  YYHelper.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/3.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYGradientAlphaView.h"

@interface YYHelper : NSObject

/*
 获取当前时间戳
 
 @return 当前时间戳(毫秒级，时间值*1000)
 */
+ (NSInteger)getNowTimestamp;

/*
 时间戳转为字符串，格式：YYYY-MM-dd HH:mm:ss
 
 @param  timestamp 需要转换的时间戳
 @return 转换后的日期字符串
 */
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp;

/*
 将时间字符串转为时间戳
 
 @param  formatTime   需要转换的时间字符串
 @param  format       字符串格式(示例：YYYY-MM-dd HH:mm:ss) hh与HH的区别:分别表示12小时制,24小时制
 @return 转换后的时间戳(毫秒级，时间值*1000)
 */
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

/*
 将日期转为日期字符串
 
 @param  date        需要转换的日期
 @param  formatStr   字符串格式(示例：YYYY-MM-dd HH:mm:ss) hh与HH的区别:分别表示12小时制,24小时制
 @return 转换后的日期字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormate:(NSString *)formatStr;

/*
 将日期字符串转为日期
 
 @param  dateStr     需要转换的日期字符串
 @param  formatStr   字符串格式(示例：YYYY-MM-dd HH:mm:ss) hh与HH的区别:分别表示12小时制,24小时制
 @return 转换后的日期
 */
+ (NSDate *)dateFromString:(NSString *)dateStr withFormate:(NSString *)formatStr;

/**
 计算NSString的Size
 
 @param text        需要计算尺寸的文本
 @param boundsize   文本允许的最大尺寸
 @param fontsize    字符串字体大小
 @return            计算得出的尺寸
 */
+ (CGSize)getSizeForString:(NSString *)text withBoundingSize:(CGSize)boundsize andFontSize:(CGFloat)fontsize;

/**
 倒计时
 
 @param time         倒计时的时间（秒）
 @param prepare      倒计时开始前的准备
 @param countting    倒计时过程中
 @param finished     倒计时结束
 */
+ (void)countDownTime:(NSInteger)time
              prepare:(void(^)(void))prepare
             counting:(void(^)(NSInteger remain))countting
             finished:(void(^)(BOOL ended))finished;

/*
 获取渐变色背景的主按钮，默认背景颜色: #42a5f6 -> #2f57f5
 
 @param fram      主按钮的Frame
 @return 主按钮
 */
+ (UIButton *)gradientButtonWithFram:(CGRect)fram;

/*
 获取渐变色背景的主按钮，默认样式：两端半圆角，字体白色14号
 
 @param fram           主按钮的Frame
 @param leftcolor      主按钮左端颜色
 @param rightcolor     主按钮右端颜色
 @return 主按钮
 */
+ (UIButton *)gradientButtonWithFram:(CGRect)fram leftColor:(UIColor *)leftcolor rightColor:(UIColor *)rightcolor;

/*
 UITableView 初始化，普通常用属性
 
 @param frame            TableView的初始Frame
 @param style            TableView的Style
 @param separatorstyle   数据条间隔线Style
 @return 初始化获得的TableView
 */
+ (UITableView *)getTableViewWithFrame:(CGRect)frame
                                 style:(UITableViewStyle)style
                        separatorStyle:(UITableViewCellSeparatorStyle)separatorstyle;

/*
 CATextLayer 初始化，普通常用属性
 
 @param frame            TextLayer的初始Frame
 @param text             TextLayer的文本
 @param color            文本颜色
 @param font             文本字体
 @param aligment         文本样式
 @return 初始化获得的TextLayer
 */
+ (CATextLayer *)getTextLayerWithFrame:(CGRect)frame
                                 title:(NSString *)text
                             textColor:(UIColor *)color
                                  font:(UIFont *)font
                              aligment:(NSTextAlignment)aligment;

@end
