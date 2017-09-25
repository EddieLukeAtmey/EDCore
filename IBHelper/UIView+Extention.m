//
//  UIView+Extention.m
//  XPOS-iPad
//
//  Created by Eddie Luke Atmey on 2016/01/20.
//  Copyright © 2016年 SmartOSC. All rights reserved.
//

#import "UIView+Extention.h"

@implementation UIView (Extention)

- (UIColor *)ed_borderColor { return [UIColor colorWithCGColor:self.layer.borderColor]; }
- (void)setEd_borderColor:(UIColor *)borderColor { self.layer.borderColor = borderColor.CGColor; }

- (CGFloat)ed_borderWidth { return self.layer.borderWidth; }
- (void)setEd_borderWidth:(CGFloat)borderWidth { self.layer.borderWidth = borderWidth; }

- (CGFloat)ed_cornerRadius { return self.layer.cornerRadius; }
- (void)setEd_cornerRadius:(CGFloat)cornerRadius { self.layer.cornerRadius = cornerRadius; }

- (BOOL)ed_maskToBound { return self.layer.masksToBounds; }
- (void)setEd_maskToBound:(BOOL)ed_maskToBound { self.layer.masksToBounds = ed_maskToBound; }

@end

@implementation UIButton (Extention)

- (NSUInteger)ed_numberOfLine { return self.titleLabel.numberOfLines; }
- (void)setEd_numberOfLine:(NSUInteger)ed_numberOfLine { self.titleLabel.numberOfLines = ed_numberOfLine; }

//- (void)setEd_imageContentMode:(UIViewContentMode *)ed_imageContentMode
//{
//    self.imageView.contentMode = ed_imageContentMode;
//
//}

@end
