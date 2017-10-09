//
//  UIViewController+TDAlert.h
//  SGBBC
//
//  Created by Tran Bao Thai on 2017/05/03.
//  Copyright © 2017 SGBBC PTE LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TDAlert)

/**
 *  Show alert with Ok action.
 *
 *  @param  title   title of alert.
 *  @param  message message of alert.
 *  @returns created alert controller for further modification
 */
- (UIAlertController *)td_showOkAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 *  Show alert with Ok action.
 *
 *  @param  title   title of alert.
 *  @param  message message of alert.
 *  @param  okAction    okAction.
 *  @returns created alert controller for further modification
 */
- (UIAlertController *)td_showOkAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                    okAction:(nullable void (^)(void))okAction;


/**
 *  Show alert with Ok / cancel action.
 *
 *  @param  title   title of alert.
 *  @param  message message of alert.
 *  @param  okTitle title of OK button.
 *  @param  cancelTitle title of cancel button.
 *  @param  okAction okAction.
 *  @returns created alert controller for further modification
 */
- (UIAlertController *)td_showConfirmAlertWithTitle:(NSString *)title
                                            message:(NSString *)message
                                            okTitle:(NSString *)okTitle
                                        cancelTitle:(NSString *)cancelTitle
                                           okAction:(nullable void (^)(void))okAction;
@end

NS_ASSUME_NONNULL_END
