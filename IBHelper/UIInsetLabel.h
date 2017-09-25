//
//  UIInsetLabel.h
//  EDCore
//
//  Created by Eddie Luke Atmey on 08/31/17.
//  Copyright © 2017 Eddie All rights reserved.
//

/**
 *  IBHelper label with inset content
 */
IB_DESIGNABLE
@interface UIInsetLabel : UILabel

@property IBInspectable CGFloat insetTop;
@property IBInspectable CGFloat insetLeft;
@property IBInspectable CGFloat insetBottom;
@property IBInspectable CGFloat insetRight;

@end
