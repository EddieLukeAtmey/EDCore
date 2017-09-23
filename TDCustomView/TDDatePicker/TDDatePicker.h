//
//  TestModel.h
//  TDCore
//
//  Created by Dao Duy Thuy on 8/11/15.
//  Copyright (c) 2015 Thuỷ Đào. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TDDatePickerDelegate <NSObject>

- (void)td_datePickerChangeValue;
- (void)td_datePickerChangeValue:(NSDate *)value;
- (void)td_datePickerCancel;
- (void)td_datePickerDone;
- (void)td_datePickerDone:(NSDate *)value;
- (void)td_datePickerShow;

@end

@interface TDDatePicker : UIView

@property (nonatomic, strong) UIView *td_transView;
@property (nonatomic, assign) BOOL td_isShowing;
@property (nonatomic, weak) IBOutlet UINavigationBar *td_NavigationBar;
@property (nonatomic, weak) IBOutlet UIDatePicker *td_dpkDate;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *td_btnCancel;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *td_btnDone;

@property (weak, nonatomic) id<TDDatePickerDelegate> TDDatePickerDelegate;


- (IBAction)btnCancelPress:(UIButton *)sender;
- (IBAction)btnDonePress:(UIButton *)sender;


- (void)td_setDatePickerMode:(UIDatePickerMode)mode;

#pragma mark - public method

//default today & UIDatePickerModeDateAndTime
+ (TDDatePicker *)initDatePickerWithDelegate:(id)target andView:(UIView *)view;

- (void)td_showView;
- (void)td_hideView;
- (void)td_configure:(UIView *)superview;

@end
