//
//  UIHelper.m
//  YiyangDoctorNew
//
//  Created by 王俊硕 on 2018/3/19.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+ (UILabel *)getLabelWith: (CGRect)frame
                    title: (NSString *)title
                     font: (UIFont *) font
                textColor: (UIColor *)color
                 aligment: (NSTextAlignment) aligment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = color;
    label.font = font;
    label.textAlignment = aligment;
    label.numberOfLines = 1;
    return label;
}



+ (UIButton *)getButtonWith: (CGRect)frame
               cornerRadius: (CGFloat)radius
                      title: (NSString *)title
                       font: (UIFont *)font
                  textColor: (UIColor *)textColor
            backgroundColor: (UIColor *)backgroundColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.layer.cornerRadius = radius;
    button.layer.masksToBounds = true;

    NSAttributedString* text = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: textColor, NSFontAttributeName: font}];
    [button setBackgroundColor:backgroundColor];
    [button setAttributedTitle:text forState:(UIControlStateNormal)];
    return button;
}

+ (UIImageView *)getImageViewWith: (CGRect)frame
                   localImageName: (NSString *)name
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:name];
    return imageView;
}
+ (UIAlertController *)getAlertWithTitle: (NSString *)title
                          cancelTitle: (NSString *)cancelTitle
                         confirmTitle: (NSString *)confirmTitle
                              cancelHandler: (void(^)(UIAlertAction *))cancelHandler
                             confirmHandler: (void(^)(UIAlertAction *))confirmHandler
{
    
    
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle: title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler: cancelHandler]];
    [alertVC addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler: confirmHandler]];
    
    return alertVC;
}

+ (UITextField *)getTextFieldWithFrame: (CGRect)frame
                                  font: (UIFont *)font
                             textColor: (UIColor *)color
                          cornerRadius: (CGFloat)radius
                           placeholder: (NSString *)placeholder
{
    UITextField* textField = [[UITextField alloc] initWithFrame:frame];
    textField.layer.cornerRadius = radius;
    textField.font = font;
    textField.textColor = color;
    textField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{ NSForegroundColorAttributeName:[UIColor sy_colorWithString:@"#DFDFDD"], NSFontAttributeName: YYFont(12)}];
    
    return textField;
}


+ (CALayer *)getSeperatorWithFrame: (CGRect)frame
                             color: (UIColor*)color
{
    if (!color) {
        color = [UIColor sy_colorWithString:@"#E8EAED"];
    }
    CALayer* seperator = [[CALayer alloc] init];
    seperator.frame = frame;
    seperator.backgroundColor = color.CGColor;
    return seperator;
}
//+ (CALayer *)getSeperatorWithY: (CGFloat)y
//                             style: (CALayerSeperatorStyle)style
//                             color: (UIColor*)color
//{
//    CALayer* seperator = [[CALayer alloc] init];
//    CGRect rect = CGRectZero;
//    switch (style) {
//        case 0:
//            rect = CGRectMake(0, y, Kwidth, 1);
//            break;
//        case 1:
//            rect = CGRectMake(fl 12, y, Kwidth-fl 12, 1);
//            break;
//        case 2:
//            rect = CGRectMake(0, y, Kwidth-fl 24, 1);
//            break;
//        case 3:
//            rect = CGRectMake(fl 12, y, Kwidth-fl 24, 1);
//            break;
//        default:
//            break;
//    }
//    seperator.frame = rect;
//    seperator.backgroundColor = color.CGColor;
//    return seperator;
//}

//获取字符串Size
+ (CGSize)getSizeForString:(NSString *)text withBoundingSize:(CGSize)boundsize andFontSize:(CGFloat)fontsize{
    /*
     关于NSStringDrawingOptions
     
     1、NSStringDrawingUsesLineFragmentOrigin
     整个文本将以每行组成的矩形为单位计算整个文本的尺寸
     2、NSStringDrawingUsesFontLeading
     使用字体的行间距来计算文本占用的范围，即每一行的底部到下一行的底部的距离计算
     3、NSStringDrawingUsesDeviceMetrics
     将文字以图像符号计算文本占用范围，而不是以字符计算。也即是以每一个字体所占用的空间来计算文本范围
     4、NSStringDrawingTruncatesLastVisibleLine
     当文本不能适合的放进指定的边界之内，则自动在最后一行添加省略符号。
     */
    
    
    UIFont * font = [UIFont systemFontOfSize:fontsize];
    CGSize size = [text boundingRectWithSize:boundsize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics attributes:@{NSFontAttributeName:font} context:nil].size;
    
    //实际测试得出，单行字符串时，按计算尺寸会造成字符串结尾省略号，
    //所以返回Size宽度+1
    return CGSizeMake(size.width+1, size.height);
}

//获取字符串Size
+ (CGSize)getSizeForString:(NSString *)text withBoundingSize:(CGSize)boundsize andFont:(UIFont *)font{
    CGSize size = [text boundingRectWithSize:boundsize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics attributes:@{NSFontAttributeName:font} context:nil].size;
    
    //实际测试得出，单行字符串时，按计算尺寸会造成字符串结尾省略号，
    //所以返回Size宽度+1
    return CGSizeMake(size.width+1, size.height);
}

//获取当前时间戳
+ (NSInteger)getNowTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //设置时区,默认北京时间
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    //现在时间
    NSDate *datenow = [NSDate date];
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]*1000] integerValue];
    return timeSp;
}

//时间戳转为字符串，格式：YYYY-MM-dd HH:mm:ss
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    //设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

//将时间字符串转为时间戳
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    //默认北京时间
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime];
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]*1000] integerValue];
    return timeSp;
}

//将日期转为日期字符串
+ (NSString *)stringFromDate:(NSDate *)date withFormate:(NSString *)formatStr{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式
    [dateFormatter setDateFormat:formatStr];
    //设置时区  默认东8区（北京时间）
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    //返回结果
    return [dateFormatter stringFromDate:date];
}

//将日期字符串转为日期
+ (NSDate *)dateFromString:(NSString *)dateStr withFormate:(NSString *)formatStr{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式
    [dateFormatter setDateFormat:formatStr];
    //设置时区  默认东8区（北京时间）
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    //返回结果
    return [dateFormatter dateFromString:dateStr];
}

//过滤nil、null字符串
+ (NSString *)NNString:(NSString *)string{
    if (string == nil || [string isEqual:[NSNull null]] || [string isEqual:@"null"] || [string isEqual:@"Null"]) {
        return @"";
    }
    return string;
}

@end
