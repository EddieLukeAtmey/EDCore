//
//  NSArray+TDCore.h
//  TDUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#pragma mark - Validate

@interface NSArray (Validate)

- (BOOL)td_isEmpty;

/** Return YES if not nil and count > 0. */
- (BOOL)td_hasValue;
- (BOOL)td_containClass:(Class)aClass;

@end

#pragma mark - Accessors

@interface NSArray (Accessors)

- (id)td_objectAtIndex:(NSUInteger)index;
- (id)td_objectOfClass:(Class)aClass;

@end
