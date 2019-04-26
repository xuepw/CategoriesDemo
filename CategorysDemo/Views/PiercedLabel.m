//
//  PiercedLabel.m
//  CategorysDemo
//
//  Created by eyoung on 2018/8/23.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import "PiercedLabel.h"

@implementation PiercedLabel

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawSubtractedText:self.text inRect:self.frame inContext:context];
}

- (void)drawSubtractedText:(NSString *)text inRect:(CGRect)rect inContext:(CGContextRef)context {
    CGContextSaveGState(context);
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,0, rect.size.width, rect.size.height)];
    label.font = self.font;
    label.adjustsFontSizeToFitWidth = YES;
    label.text = text;
    label.textAlignment = self.textAlignment;
    label.backgroundColor = self.backgroundColor;
    [label.layer drawInContext:context];
    
    CGContextRestoreGState(context);
}

@end
