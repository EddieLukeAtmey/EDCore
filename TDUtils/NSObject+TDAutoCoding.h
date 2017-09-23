//
//  NSObject+TDAutoCoding.h
//  Pods
//
//  Created by sa vincent on 6/22/16.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (TDAutoCoding)

+ (instancetype)td_objectWithContentsOfFile:(NSString *)path;
- (BOOL)td_writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end
