//
//  TestModel.m
//  TDCore
//
//  Created by Dao Duy Thuy on 8/11/15.
//  Copyright (c) 2015 Thuỷ Đào. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel


- (void)abc
{
    NSLog(@"%@",self.name);
}


- (void)print
{
    NSLog(@"%@",self.name);
}

- (void)td_initialize
{
    self.name = @"abc";
}

@end
