//
//  UIInsetLabel.h
//  EDCore
//
//  Created by Eddie Luke Atmey on 08/31/17.
//  Copyright © 2017 Eddie All rights reserved.
//

#import "UIInsetLabel.h"

@implementation UIInsetLabel

// Override draw text with new inset
- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets inset = UIEdgeInsetsMake(self.insetTop, self.insetLeft, self.insetBottom, self.insetRight);
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, inset)];
}

/** Override content size calculation */
- (CGSize)intrinsicContentSize
{
    CGSize contentSize  = [super intrinsicContentSize];
    contentSize.width  += (self.insetLeft + self.insetRight);
    contentSize.height += (self.insetTop + self.insetBottom);

    return contentSize;
}

@end
