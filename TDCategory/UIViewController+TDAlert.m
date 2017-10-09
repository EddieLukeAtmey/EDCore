//
//  UIViewController+TDAlert.m
//  SGBBC
//
//  Created by Tran Bao Thai on 2017/05/03.
//  Copyright © 2017 SGBBC PTE LTD. All rights reserved.
//

#import "UIViewController+TDAlert.h"

@implementation UIViewController (TDAlert)

- (UIAlertController *)td_showOkAlertWithTitle:(NSString *)title message:(NSString *)message {
    return [self td_showOkAlertWithTitle:title message:message okAction:nil];
}

- (UIAlertController *)td_showOkAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                    okAction:(void (^)(void))okAction {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          if (okAction) {
                                                              okAction();
                                                          }
                                                      }]];
    [self presentViewController:alertController animated:YES completion:nil];

    return alertController;
}

- (UIAlertController *)td_showConfirmAlertWithTitle:(NSString *)title
                                            message:(NSString *)message
                                            okTitle:(NSString *)okTitle
                                        cancelTitle:(NSString *)cancelTitle
                                           okAction:(void (^)(void))okAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:[UIAlertAction actionWithTitle:okTitle
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          if (okAction) {
                                                              okAction();
                                                          }
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];

    return alertController;
}

@end
