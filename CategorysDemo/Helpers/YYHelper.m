//
//  YYHelper.m
//  CategorysDemo
//
//  Created by eyoung on 2018/4/3.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYHelper.h"

@implementation YYHelper

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
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
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
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    //返回结果
    return [dateFormatter dateFromString:dateStr];
}

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

//倒计时
+ (void)countDownTime:(NSInteger)time prepare:(void(^)(void))prepare counting:(void (^)(NSInteger remain))countting finished:(void(^)(BOOL ended))finished{
    //准备工作
    if (prepare) {
        prepare();
    }
    
    __block NSInteger countTime = time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(countTime <= 0){
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if(finished){
                    finished(YES);
                }
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //倒计时进行中
                if(countting){
                    countting(countTime);
                }
                countTime--;
            });
        }
    });
    dispatch_resume(_timer);
}

//默认渐变色大按钮
+ (UIButton *)gradientButtonWithFram:(CGRect)fram{
    UIColor * leftColor = [UIColor sy_colorWithString:@"#42a5f6"];
    UIColor * rightColor = [UIColor sy_colorWithString:@"#2f57f5"];
    return [YYHelper gradientButtonWithFram:fram leftColor:leftColor rightColor:rightColor];
}

//渐变色大按钮
+ (UIButton *)gradientButtonWithFram:(CGRect)fram leftColor:(UIColor *)leftcolor rightColor:(UIColor *)rightcolor{
    UIImage * btnBgImg = [YYGradientAlphaView gradientImgFromColors:@[leftcolor,rightcolor] withFrame:CGRectMake(0, 0, fram.size.width, fram.size.height)];
    UIButton * bigButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigButton.frame = fram;
    bigButton.layer.masksToBounds = YES;
    bigButton.layer.cornerRadius = fram.size.height/2;
    bigButton.titleLabel.font = [UIFont systemFontOfSize:14*KScale];
    [bigButton setBackgroundImage:btnBgImg forState:UIControlStateNormal];
    [bigButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return bigButton;
}

//初始化TableView
+ (UITableView *)getTableViewWithFrame:(CGRect)frame
                                 style:(UITableViewStyle)style
                        separatorStyle:(UITableViewCellSeparatorStyle)separatorstyle{
    UITableView * newTableView = [[UITableView alloc] initWithFrame:frame style:style];
    newTableView.separatorStyle = separatorstyle;
    //
    if (style == UITableViewStyleGrouped) {
        newTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 0.1)];
        newTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 0.1)];
    }
    return newTableView;
}

//初始化CATextLayer
+ (CATextLayer *)getTextLayerWithFrame:(CGRect)frame
                                 title:(NSString *)text
                             textColor:(UIColor *)color
                                  font:(UIFont *)font
                              aligment:(NSTextAlignment)aligment{
    // 绘制文本的图层
    CATextLayer *layerText = [[CATextLayer alloc] init];
    // 背景颜色
    layerText.backgroundColor = [UIColor clearColor].CGColor;
    // 渲染分辨率-重要，否则显示模糊
    layerText.contentsScale = [UIScreen mainScreen].scale;
    // 显示位置(中心位置)
    layerText.position = CGPointMake(frame.origin.x+frame.size.width/2, frame.origin.y+frame.size.height/2);
    // 显示区域(根据文本自适应，计算文本上下居中)
    CGSize suitSize = [text boundingRectWithSize:frame.size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics attributes:@{NSFontAttributeName:font} context:nil].size;
    CGFloat textTop = 0;
    if (suitSize.height > frame.size.height) {
        //textTop = ;
    } else if (suitSize.height < frame.size.height) {
        textTop = (suitSize.height-frame.size.height)/2+5;
    }
    layerText.bounds = CGRectMake(0, textTop, frame.size.width, frame.size.height);
    // 分行显示
    layerText.wrapped = YES;
    // 超长显示时，省略号位置
    layerText.truncationMode = kCATruncationEnd;
    // 字体颜色
    layerText.foregroundColor = color.CGColor;
    // 字体名称、大小
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef =CGFontCreateWithFontName(fontName);
    layerText.font = fontRef;
    layerText.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    // 字体对方方式
    switch (aligment) {
        case NSTextAlignmentLeft:
            layerText.alignmentMode = kCAAlignmentLeft;
            break;
        case NSTextAlignmentRight:
            layerText.alignmentMode = kCAAlignmentRight;
            break;
        case NSTextAlignmentCenter:
            layerText.alignmentMode = kCAAlignmentCenter;
            break;
        case NSTextAlignmentNatural:
            layerText.alignmentMode = kCAAlignmentNatural;
            break;
        case NSTextAlignmentJustified:
            layerText.alignmentMode = kCAAlignmentJustified;
            break;
        default:
            break;
    }
    // 方法1-简单显示
    layerText.string = text;
    return layerText;
}

@end
