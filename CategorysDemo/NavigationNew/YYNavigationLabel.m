//
//  YYNavigationLabel.m
//  CategorysDemo
//
//  Created by eyoung on 2018/5/12.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "YYNavigationLabel.h"

@implementation YYNavigationLabel

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:17*KScale];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
    }
    
    return self;
}

@end
