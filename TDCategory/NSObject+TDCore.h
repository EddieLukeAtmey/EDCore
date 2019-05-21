//
//  NSObject+TDCore.h
//  Pods
//
//  Created by Dao Duy Thuy on 9/28/15.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (TDCore)

#pragma mark - TD_BLOCK
+ (void)td_mainThread:(void (^)(void))block;
+ (void)td_backgroundThread:(void (^)(void))block;
+ (void)td_mainThread:(void (^)(void))block afterDelay:(double)secs;


@end
