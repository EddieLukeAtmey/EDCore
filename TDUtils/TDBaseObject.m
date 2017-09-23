//
//  TBBaseObject.m
//  mPos
//
//  Created by thuydd on 1/30/15.
//  Copyright (c) 2015 SmartOSCVietNam. All rights reserved.
//

#import "TDBaseObject.h"
#import <objc/runtime.h>


static NSMutableDictionary *sharedInstance = nil;
@implementation TDBaseObject

#pragma mark - private

/**
 *  init
 *
 *  @return instancetype
 */
- (instancetype)init
{
  self = [super init];
  if (self) {
    [self td_initialize];
  }
  return(self);
}


/**
 *  initialize
 *  Overwrite to customize init object
 */
- (void)td_initialize
{
  NSLog(@"%s",__FUNCTION__);
}

#pragma mark - singleton

/**
 *  sharedInstance
 *
 *  @return v
 */
+ (instancetype)td_sharedInstance
{
  TDBaseObject *obj = nil;
  @synchronized(self) {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
      
      sharedInstance = [NSMutableDictionary new];
    });
    
    NSString *className = NSStringFromClass([self class]);
    
    obj = [sharedInstance objectForKey:className];
    
    if ( !obj )
    {
      obj = [[[self class] alloc] init];
      [sharedInstance setValue:obj forKey:className];
    }
  }
  
  return obj;
  
}

- (NSArray *)allPropertyNames
{
  unsigned count;
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  
  NSMutableArray *rv = [NSMutableArray array];
  
  unsigned i;
  for (i = 0; i < count; i++)
  {
    objc_property_t property = properties[i];
    NSString *name = [NSString stringWithUTF8String:property_getName(property)];
    [rv addObject:name];
  }
  
  free(properties);
  
  return rv;
}

- (NSDictionary *)td_dictionary
{
  NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  for (__unsafe_unretained NSString *key in [self allPropertyNames])
  {
    id value = [self valueForKey:key];
    if (value) dict[key] = value;
  }
  return dict;
}

@end
