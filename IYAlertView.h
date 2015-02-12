//
//  ComeleoAlertHelper.h
//  Comeleo
//
//  Created by Ivan Yorgov on 01.10.14.
//  Copyright (c) 2014 г. Osceola SWD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "IYAlertViewAction.h"

@interface IYAlertView : NSObject

+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message andActions:(NSArray *)actions inViewContext:(id)context;
+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions andTextField:(UITextField *)textFieldToAdd inViewContext:(id)context;

- (id)initAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions textField:(UITextField *)textFieldToAdd andViewContext:(id)context;
- (void)showAlert;
- (void)dismissAlert;

@end
