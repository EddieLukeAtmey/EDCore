//
//  NSDecimalNumber+EDCore.h
//  EDCore
//
//  Created by Eddie Luke Atmey on 09/29/17.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (EDCore)

+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)anotherNumber;

/** Get nsdecimal absolute value. */
- (NSDecimalNumber *)td_absoluteValue;

#pragma mark - Comparision

/** return YES if receiver > anotherNumber. */
- (BOOL)td_isGreaterThan:(NSNumber *)anotherNumber;

/** return YES if receiver == anotherNumber. */
- (BOOL)td_isEqualTo:(NSNumber *)anotherNumber;

/** return YES if receiver < anotherNumber. */
- (BOOL)td_isSmallerThan:(NSNumber *)anotherNumber;

@end
