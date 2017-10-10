//
//  UIColor+Core.m
// Core
//
//  " on 8/16/14.
//  ". All rights reserved.
//

#import "UIColor+TDCore.h"

@implementation UIColor (TDCore)

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue
{
    return [self colorWithARGBHex:(0xFF000000 | hexValue)];
}

+ (UIColor *)colorWithARGBHex:(NSInteger)hexValue
{
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16) / 255.0
                           green:((hexValue & 0xFF00) >> 8) / 255.0
                            blue:((hexValue & 0xFF)) / 255.0
                           alpha:((hexValue & 0xFF000000) >> 24) / 255.0];
}

- (UIImage *)td_asBackgroundImage
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
