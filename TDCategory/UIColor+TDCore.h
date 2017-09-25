//
//  UIColor+Core.h
// Core
//
//  " on 8/16/14.
//  ". All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TDCore)

/** Init a color with its RGB hex value (E.g. 0xFF0000 = Red Color). alpha = 1. */
+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue;

/** Init a color with its ARGB hex value (E.g. 0x00FF0000 = Red transparent color (alpha = 0). */
+ (UIColor *)colorWithARGBHex:(NSInteger)hexValue;

@end
