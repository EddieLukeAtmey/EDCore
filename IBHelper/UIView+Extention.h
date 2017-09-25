//
//  UIView+Extention.h
//  XPOS-iPad
//
//  Created by Eddie Luke Atmey on 2016/01/20.
//  Copyright © 2016年 SmartOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extention)

@property (nonatomic) IBInspectable UIColor *ed_borderColor;
@property (nonatomic) IBInspectable CGFloat ed_borderWidth;
@property (nonatomic) IBInspectable CGFloat ed_cornerRadius;
@property (nonatomic) IBInspectable BOOL ed_maskToBound;

@end

@interface UIButton (Extention)

@property (nonatomic) IBInspectable NSUInteger ed_numberOfLine;
//@property (nonatomic) IBInspectable UIViewContentMode ed_imageContentMode;

@end
