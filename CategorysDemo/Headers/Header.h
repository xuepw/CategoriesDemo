//
//  Header.h
//  InternetPatient
//
//  Created by YY_ZYQ on 2017/12/6.
//  Copyright © 2017年 YY_ZYQ. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Kwidth   [UIScreen mainScreen].bounds.size.width
#define Kheight  [UIScreen mainScreen].bounds.size.height
#define phoneVersion [[[UIDevice currentDevice] systemVersion] floatValue]
//适配iPhone X
#define SafeAreaTopHeight (Kheight == 812.0 ? 88 : 64)
#define SafeAreaBottomHeight (Kheight == 812.0 ? 34 : 0)
#define KScale Kwidth/375

///屏幕高度-安全顶部-安全底部
#define KSafeContentHeight Kheight - SafeAreaTopHeight - SafeAreaBottomHeight
///屏幕高度-安全顶部-安全底部-TabBar49
#define KSafeContentHeightWithTabBar Kheight - SafeAreaTopHeight - SafeAreaBottomHeight - 49
///TableView里的row
#define KRow indexPath.row
///TableView里的section
#define KSection indexPath.section
#define fl KScale*
#define IsEmptyString(...) (__VA_ARGS__ == nil || [__VA_ARGS__ isEmpty])

#define DebugMode YES
/// 根据DebugMode开发输出
#define DBLog(format, ...) if (DebugMode) { NSLog(format, ## __VA_ARGS__) }
#define Palette [YYPalette shared]
/// 提示正在开发中
#define DEVELOPING [YYHelper showWarningText:@"此项功能正在开发中..." style:(showWariningMiddle)];
//解决控制台打印输出不完全
#define CLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

//NSNotificationCenter     NotifyNames
#define YYNotify_AddNewFollow   @"YYNotify_AddNewFollowSuccess"


#endif /* Header_h */
