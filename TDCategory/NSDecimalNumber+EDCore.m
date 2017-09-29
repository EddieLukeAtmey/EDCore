//
//  NSDecimalNumber+EDCore.m
//  EDCore
//
//  Created by Eddie Luke Atmey on 09/29/17.
//

#import "NSDecimalNumber+EDCore.h"

@implementation NSDecimalNumber (EDCore)

+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)anotherNumber
{
    return [NSDecimalNumber decimalNumberWithDecimal:anotherNumber.decimalValue];
}

- (NSDecimalNumber *)td_absoluteValue
{
    if ([self td_isSmallerThan:[NSDecimalNumber zero]]) {
        return [self decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:YES]];
    }

    return self;
}

- (BOOL)td_isGreaterThan:(NSNumber *)anotherNumber { return [self compare:anotherNumber] == NSOrderedDescending; }
- (BOOL)td_isEqualTo:(NSNumber *)anotherNumber     { return [self compare:anotherNumber] == NSOrderedSame; }
- (BOOL)td_isSmallerThan:(NSNumber *)anotherNumber { return [self compare:anotherNumber] == NSOrderedAscending; }

@end
