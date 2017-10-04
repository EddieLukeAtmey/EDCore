//
//  NSDictionary+TDCore.m
//  tdUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import "NSDictionary+TDCore.h"

@implementation NSDictionary (TDCore)

@end

#pragma mark - Accessors
@implementation NSDictionary (Accessors)

- (id)td_objectForKey:(NSString *)key
{
    id object = [self objectForKey:key];

    if ( !object || object == NULL || object == [NSNull null] ) {
        return nil;
    }

    return object;
}

- (NSDictionary *)td_dictionaryForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object isKindOfClass:[NSDictionary class]] ? object : @{};
}

- (NSMutableDictionary *)td_mutableDictionaryForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    
    if ([object isKindOfClass:[NSDictionary class]] ) {
        return [NSMutableDictionary dictionaryWithDictionary:object];
    }
    
    return [NSMutableDictionary new];
}

- (NSArray *)td_arrayForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object isKindOfClass:[NSArray class]] ? object : @[];
}

- (NSMutableArray *)td_mutableArrayForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    
    if ( [object isKindOfClass:[NSArray class]] ) {
        return [NSMutableArray arrayWithArray:object];
    }

    return [NSMutableArray new];
}


- (NSString *)td_stringForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];

    if ( [object isKindOfClass:[NSString class]] ) return object;
    else if ( object ) return [NSString stringWithFormat:@"%@", object];

    return @"";
}

- (NSInteger)td_intForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object respondsToSelector:@selector(integerValue)] ? [object integerValue] : 0;
}

- (NSDecimalNumber *)td_decimalNumberForKey:(NSString *)key
{
    NSString *stringNumber = [self td_stringForKey:key];

    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];

    if ([decimalNumber isEqualToNumber:[NSDecimalNumber notANumber]]) return [NSDecimalNumber zero];
    return decimalNumber;
}

- (float)td_floatForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object respondsToSelector:@selector(floatValue)] ? [object floatValue] : 0.0f;
}

- (double)td_doubleForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object respondsToSelector:@selector(doubleValue)] ? [object doubleValue] : 0.0f;
}

- (BOOL)td_boolForKey:(NSString *)key
{
    id object = [self td_objectForKey:key];
    return [object respondsToSelector:@selector(boolValue)] ? [object boolValue] : object != nil;
}

@end
