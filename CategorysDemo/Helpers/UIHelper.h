//
//  UIHelper.h
//  YiyangDoctorNew
//
//  Created by 王俊硕 on 2018/3/19.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
/// fl 之后的UIFont
#define YYFont(...)      [UIFont systemFontOfSize: fl __VA_ARGS__]
#define YYFontMedi(...)  [UIFont systemFontOfSize: fl __VA_ARGS__ weight:UIFontWeightMedium]
#define YYFontBold(...)  [UIFont boldSystemFontOfSize: fl __VA_ARGS__]

typedef NS_ENUM(NSUInteger, CALayerSeperatorStyle) {
    CALayerSeperatorStyleAll = 0, // 与屏幕一样宽
    CALayerSeperatorStyleNoLeft, // 左边12
    CALayerSeperatorStyleNoRight, // 右边12
    CALayerSeperatorStyleNoSides // 两边各12
};

@interface UIHelper : NSObject

/// 返回一个只有一行的Label
+ (UILabel *)getLabelWith: (CGRect)frame
                    title: (NSString *)title
                     font: (UIFont *) font
                textColor: (UIColor *)color
                 aligment: (NSTextAlignment) aligment;

/// 返回按钮，所有设置都是通过attributedTitle对normal状态下设置
+ (UIButton *)getButtonWith: (CGRect)frame
               cornerRadius: (CGFloat)radius
                      title: (NSString *)title
                       font: (UIFont *)font
                  textColor: (UIColor *)textColor
            backgroundColor: (UIColor *)backgroundColor;

/// 返回图片控件
+ (UIImageView *)getImageViewWith: (CGRect)frame
                   localImageName: (NSString *)name;

/*
  返回AlertController
 注意： TableView Cell SelectionStyleNone时候， 需要在主线程presnet
 */
+ (UIAlertController *)getAlertWithTitle: (NSString *)title
                             cancelTitle: (NSString *)cancelTitle
                            confirmTitle: (NSString *)confirmTitle
                           cancelHandler: (void(^)(UIAlertAction *))cancelHandler
                          confirmHandler: (void(^)(UIAlertAction *))confirmHandler;

/*
 返回文本框
 占位符的样式需要在特定的工程当中自行设定。
 */
+ (UITextField *)getTextFieldWithFrame: (CGRect)frame
                                  font: (UIFont *)font
                             textColor: (UIColor *)color
                          cornerRadius: (CGFloat)radius
                           placeholder: (NSString *)placeholder;

/// 返回水平分割线
+ (CALayer *)getSeperatorWithFrame: (CGRect)frame
                             color: (UIColor*)color;

//+ (CALayer *)getSeperatorWithY: (CGFloat)y
//                         style: (CALayerSeperatorStyle)style
//                         color: (UIColor*)color;

/**
 计算NSString的Size
 
 @param text        需要计算尺寸的文本
 @param boundsize   文本允许的最大尺寸
 @param fontsize    字符串字体大小
 @return            计算得出的尺寸
 */
+ (CGSize)getSizeForString:(NSString *)text withBoundingSize:(CGSize)boundsize andFontSize:(CGFloat)fontsize;

//获取字符串Size
+ (CGSize)getSizeForString:(NSString *)text withBoundingSize:(CGSize)boundsize andFont:(UIFont *)font;

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
 @param  formatStr   字符串格式(示例：YYYY-MM-dd HH:mm:ss.SSS) hh与HH的区别:分别表示12小时制,24小时制
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

/*
 过滤nil、null字符串
 
 @param  string      需要处理的字符串
 @return 转换后的非nil，非null，非“null”字符串
 */
+ (NSString *)NNString:(NSString *)string;
@end
