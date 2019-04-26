//
//  UUColor.h
//  UUChart
//
//  Created by shake on 14-7-24.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import <UIKit/UIKit.h>


#define chartMargin         10*KScale
#define xLabelMargin        15*KScale
#define yLabelMargin        15*KScale
#define UULabelHeight       10*KScale
#define UUYLabelwidth       30*KScale
#define UUTagLabelwidth     80*KScale

#define KScale Kwidth/375
#define Kwidth   [UIScreen mainScreen].bounds.size.width

//范围
struct Range {
    CGFloat max;
    CGFloat min;
};
typedef struct Range CGRange;
CG_INLINE CGRange CGRangeMake(CGFloat max, CGFloat min);

CG_INLINE CGRange
CGRangeMake(CGFloat max, CGFloat min){
    CGRange p;
    p.max = max;
    p.min = min;
    return p;
}

static const CGRange CGRangeZero = {0,0};

@interface UUColor : UIColor
+(UIColor *)randomColor;
+(UIColor *)randomColorDeep;
+(UIColor *)randomColorlight;
+(UIColor *)red;
+(UIColor *)green;
+(UIColor *)brown;
@end
