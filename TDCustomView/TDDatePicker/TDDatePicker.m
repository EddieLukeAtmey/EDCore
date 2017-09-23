//
//  TestModel.m
//  TDCore
//
//  Created by Dao Duy Thuy on 8/11/15.
//  Copyright (c) 2015 Thuỷ Đào. All rights reserved.
//

#import "TDDatePicker.h"

@implementation TDDatePicker

+ (TDDatePicker *)initDatePickerWithDelegate:(id)target andView:(UIView *)view
{
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"TDCore" withExtension:@"bundle"]];
    
    TDDatePicker *tdDatePicker = (TDDatePicker *)[[bundle loadNibNamed:NSStringFromClass([TDDatePicker class]) owner:self options:nil] firstObject];
    
    [tdDatePicker td_setDatePickerMode:UIDatePickerModeDateAndTime];
    [tdDatePicker td_configure:view];
    tdDatePicker.td_dpkDate.date = [NSDate date];
    tdDatePicker.TDDatePickerDelegate = (id)self;
    return tdDatePicker;
}

- (void)initTransView
{
    if(!self.td_transView)
    {
        self.td_transView = [[UIView alloc] init];
        self.td_transView.userInteractionEnabled = YES;
        [self.td_transView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:(id)self action:@selector(clicktoAllSpace)]];
    }

}

- (void)td_setDatePickerMode:(UIDatePickerMode)mode
{
    self.td_dpkDate.datePickerMode = mode;
    [self.td_dpkDate addTarget:(id)self action:@selector(changeOneSelf) forControlEvents:UIControlEventValueChanged];
    [self initTransView];
}

- (void)td_configure:(UIView *)superview
{
    [self initTransView];
    self.TDDatePickerDelegate = (id)self;
    [superview addSubview:self.td_transView];
    [superview addSubview:self];
    self.frame = [self hiddenRect];
    self.td_transView.hidden = YES;
    self.hidden = YES;
    
}

- (void)td_showView
{
    self.td_transView.frame = CGRectMake(0.0f, 0.0f, self.superview.frame.size.width, self.superview.frame.size.height);
    
    [self showOneSelf];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.td_isShowing = YES;
    self.hidden = NO;
    self.td_transView.hidden = NO;
    self.frame = CGRectMake(0, self.superview.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    self.td_transView.alpha = 1.0;
    [UIView commitAnimations];
}

- (void)td_hideView
{
    self.td_isShowing = NO;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    CGRect rect = self.frame;
    rect.origin.y = self.superview.frame.size.height*2;
    self.frame = rect;
    self.hidden = YES;
    self.td_transView.hidden = YES;
    self.td_transView.alpha = 0.0;
    [UIView commitAnimations];
    
    self.td_transView.frame = CGRectMake(0.0f, self.superview.frame.size.height*2, self.superview.frame.size.width, self.superview.frame.size.height);
    
}

- (CGRect)hiddenRect
{
    return CGRectMake(0, self.superview.frame.size.height*2, self.superview.frame.size.width, self.frame.size.height);
}

- (IBAction)btnCancelPress:(UIButton *)sender
{
    [self td_hideView];
    [self cancelOneSelf];
}

- (IBAction)btnDonePress:(UIButton *)sender
{
    [self td_hideView];
    [self doneOneSelf];
}

- (void)clicktoAllSpace
{
    [self td_hideView];
    [self cancelOneSelf];
}

- (void)showOneSelf
{
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerShow)]) {
        [self.TDDatePickerDelegate td_datePickerShow];
    }
}

- (void)cancelOneSelf
{
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerCancel)]) {
        [self.TDDatePickerDelegate td_datePickerCancel];
    }
}

- (void)doneOneSelf
{
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerDone)]) {
        [self.TDDatePickerDelegate td_datePickerDone];
    }
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerDone:)]) {
        [self.TDDatePickerDelegate td_datePickerDone:self.td_dpkDate.date];
    }
}

- (void)changeOneSelf
{
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerChangeValue)]) {
        [self.TDDatePickerDelegate td_datePickerChangeValue];
    }
    if (self.TDDatePickerDelegate && [self.TDDatePickerDelegate respondsToSelector:@selector(td_datePickerChangeValue:)]) {
        [self.TDDatePickerDelegate td_datePickerChangeValue:self.td_dpkDate.date];
    }
}

@end
