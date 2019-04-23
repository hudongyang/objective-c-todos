//
//  UIColor+Extensions.m
//  xhc_ios
//
//  Created by dongyang on 2019/3/13.
//  Copyright © 2019 dongyang. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (Extensions)
+ (UIColor *)colorWithR:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

@end
