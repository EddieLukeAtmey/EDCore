//
//  NSArray+TDCore.m
//  TDUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import "NSArray+TDCore.h"

#pragma mark - Validate

@implementation NSArray (Validate)

- (BOOL)td_isEmpty { return (self.count == 0); }
- (BOOL)td_hasValue { return self.count > 0; }

- (BOOL)td_containClass:(Class)aClass
{
    for (id object in self) {
        if ( [object isKindOfClass:aClass]) {
            return YES;
        }
    }

    return NO;
}

@end

#pragma mark - Accessors

@implementation NSArray (Accessors)

- (id)td_objectAtIndex:(NSUInteger)index { return self.count > index ? [self objectAtIndex:index] : nil; }

- (id)td_objectOfClass:(Class)aClass
{
    for (id anObject in self) {
        if ([anObject isKindOfClass:aClass]) {
            return anObject;
        }
    }
    return nil;
}

@end


