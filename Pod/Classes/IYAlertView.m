//
//  ComeleoAlertHelper.m
//  Comeleo
//
//  Created by Ivan Yorgov on 01.10.14.
//  Copyright (c) 2014 г. Ivan Yorgov. All rights reserved.
//

#import "IYAlertView.h"
#import "UIAlertView+Completion.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface IYAlertView ()

@property (strong, nonatomic) id alert;
@property (strong, nonatomic) id viewContext;

@end

@implementation IYAlertView

+ (id)initAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions textField:(UITextField *)textFieldToAdd andViewContext:(id)context
{
    id alert = nil;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        
        if (!title) {
            title = @"";
        }
        NSString *messageRefactor = nil;
        
        if (message) {
            messageRefactor = [NSString stringWithFormat:@"\n%@", message];
        }
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageRefactor preferredStyle:UIAlertControllerStyleAlert];
        
        for (IYAlertViewAction *comeleoAction in actions) {
            [alertController addAction:[UIAlertAction actionWithTitle:comeleoAction.title style:comeleoAction.actionType handler:^(UIAlertAction *action) {
                if (comeleoAction.actionHandler) {
                    comeleoAction.actionHandler(alertController);
                }
            }]];
        }
        
        if (actions.count == 0 || !actions) {
            [alertController addAction:[UIAlertAction actionWithTitle:[IYAlertViewAction defaultAction].title style:[IYAlertViewAction defaultAction].actionType handler:[IYAlertViewAction defaultAction].actionHandler]];
        }
        
        if (textFieldToAdd) {
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.secureTextEntry = textFieldToAdd.secureTextEntry;
                textField.placeholder = textFieldToAdd.placeholder;
            }];
        }
        
        alert = alertController;
        
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] init];
        alertView.title = title;
        alertView.message = message;
        
        for (IYAlertViewAction *alertAction in actions) {
            [alertView addButtonItemWithAlertAction:alertAction];
        }
        
        if (actions.count == 0 || !actions) {
            [alertView addButtonItemWithAlertAction:[IYAlertViewAction defaultAction]];
        }
        
        if (textFieldToAdd) {
            [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput];
            [[alertView textFieldAtIndex:0] setDelegate:textFieldToAdd.delegate];
        }
        
        alert = alertView;
    }
    
    return alert;
}

+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message andActions:(NSArray *)actions inViewContext:(id)context
{
    id alert = [self initAlertWithTitle:title message:message actions:actions textField:nil andViewContext:context];
    
    if ([alert isKindOfClass:[UIAlertView class]]) {
        [alert show];
    } else {
        if ([context respondsToSelector:@selector(presentViewController:animated:completion:)]) {
            [context presentViewController:alert animated:YES completion:nil];
        } else {
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }
    }
}

+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions andTextField:(UITextField *)textFieldToAdd inViewContext:(id)context
{
    id alert = [self initAlertWithTitle:title message:message actions:actions textField:textFieldToAdd andViewContext:context];
    
    if ([alert isKindOfClass:[UIAlertView class]]) {
        [alert show];
    } else {
        [context presentViewController:alert animated:YES completion:nil];
    }
}

- (id)initAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions textField:(UITextField *)textFieldToAdd andViewContext:(id)context
{
    if (self = [super init]) {
        self.alert = [IYAlertView initAlertWithTitle:title message:message actions:actions textField:textFieldToAdd andViewContext:context];
        self.viewContext = context;
    }
    
    return self;
}

- (void)showAlert
{
    if ([self.alert isKindOfClass:[UIAlertView class]]) {
        [self.alert show];
    } else {
        [self.viewContext presentViewController:self.alert animated:YES completion:nil];
    }
}

- (void)dismissAlert
{
    if ([self.alert isKindOfClass:[UIAlertView class]]) {
        [self.alert dismissWithClickedButtonIndex:-1 animated:YES];
    } else {
        [self.viewContext dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
