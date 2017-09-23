//
//  TDViewController.m
//  TDCore
//
//  Created by Thuỷ Đào on 06/15/2015.
//  Copyright (c) 2014 Thuỷ Đào. All rights reserved.
//

#import "TDViewController.h"
#import "TestModel.h"
#import "TestMultiDelegate.h"
#import "TDViewController1.h"

@interface TDViewController ()
{
    TDDatePicker *vi;
}
@end

@implementation TDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    vi = (TDDatePicker *)TD_CORE_VIEW_WITH_XIB_NAME(@"TDDatePicker");
    [vi td_setDatePickerMode:UIDatePickerModeDateAndTime];
    [vi td_configure:self.view];
    
    /*
    //test multi delegate
    TestMultiDelegate *testobj = [[TestMultiDelegate alloc] td_initWithDelegates:nil];
    
    TestModel *model1 = [TestModel new];
    model1.name = @"model1";
    [testobj td_addDelegate:model1];
    
    model1 = nil;
    
    TestModel *model2 = [TestModel new];
    model2.name = @"model2";
    [testobj td_addDelegate:model2];
    
    [testobj td_respondsToSelector:@selector(abc)];
    
    //test singleton
    [TestModel td_sharedInstance].name = @"test singleton";
    [[TestModel td_sharedInstance] print];
    
    if (td_isTheme(@"2"))
    {
        
    }
     */
    self.storyboard.familyNameFile = @"TestPlistStoryboard";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)changeView:(id)sender {
    
    [self td_pushViewControllerWithClass:[TDViewController1 class]];
}

- (IBAction)showPickerDate:(id)sender {
    
    
    [vi td_showView];
}

- (void)td_datePickerChangeValue;
{
     NSLog(@"%s [Line %d] %@",__FUNCTION__, __LINE__, NSStringFromClass([self class]));
}

- (void)td_datePickerDismis
{
     NSLog(@"%s [Line %d] %@",__FUNCTION__, __LINE__, NSStringFromClass([self class]));
}

- (void)td_datePickerShow
{
     NSLog(@"%s [Line %d] %@",__FUNCTION__, __LINE__, NSStringFromClass([self class]));
}


@end
