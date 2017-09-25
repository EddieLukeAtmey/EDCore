//
//  NSDictionary+TDCore.h
//  tdUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Accessors
@interface NSDictionary (Accessors)

- (nullable id)td_objectForKey:(NSString *)key;

- (NSDictionary *)td_dictionaryForKey:(NSString *)key;
- (NSMutableDictionary *)td_mutableDictionaryForKey:(NSString *)key;
- (NSArray *)td_arrayForKey:(NSString *)key;
- (NSMutableArray *)td_mutableArrayForKey:(NSString *)key;
- (NSString *)td_stringForKey:(NSString *)key;
- (NSInteger)td_intForKey:(NSString *)key;

/** Return [NSDecimalNumber zero] if object invalid (null, nil, nan...). */
- (NSDecimalNumber *)td_decimalNumberForKey:(NSString *)key;

- (float)td_floatForKey:(NSString *)key;
- (double)td_doubleForKey:(NSString *)key;
- (BOOL)td_boolForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
