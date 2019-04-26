//
//  NextController.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/12.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <FSCalendar/FSCalendar.h>
#import "NextController.h"
#import "YYGradientAlphaView.h"

@interface NextController ()<FSCalendarDelegate, FSCalendarDataSource>

@property (strong, nonatomic) YYGradientAlphaView * bgView;
@property (strong, nonatomic) FSCalendar * calendar;

@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"NextVC";
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.calendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (YYGradientAlphaView *)bgView{
    if (!_bgView) {
        UIColor * topColor = [UIColor sy_colorWithString:@"#2BAFF7"];
        UIColor * botColor = [UIColor sy_colorWithString:@"#862AB8"];
        _bgView = [[YYGradientAlphaView alloc] initWithFrame:self.view.frame topColor:topColor bottomColor:botColor];
    }
    return _bgView;
}

- (FSCalendar *)calendar{
    if (!_calendar) {
        _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(10*KScale, SafeAreaTopHeight+10*KScale, Kwidth-20*KScale, 300*KScale)];
        _calendar.delegate = self;
        _calendar.dataSource = self;
        _calendar.backgroundColor = UIColor.whiteColor;
        _calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        //标题格式
        _calendar.appearance.headerDateFormat = @"yyyy年MM月";
        //上一月、下一月透明度
        _calendar.appearance.headerMinimumDissolvedAlpha = 0;
        //事件圆点颜色
        _calendar.appearance.eventDefaultColor = UIColor.orangeColor;
    }
    return _calendar;
}

#pragma mark ----------FSCalendarDelegate----------
//选中日期
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
}

//取消选中日期
- (void)calendar:(FSCalendar *)calendar didDeselectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
}

#pragma mark ----------FSCalendarDataSource----------
//显示事件圆点数
- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date{
    return 1;
}

- (void)dealloc{
    DBLog(@"NextVC   -------dealloc");
}

@end
