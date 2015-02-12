//
//  UIAlertView+Completion.m
//  Comeleo
//
//  Created by Ivan Yorgov on 08.07.14.
//  Copyright (c) 2014 г. Osceola SWD. All rights reserved.
//

#import <objc/runtime.h>
#import "UIAlertView+Completion.h"
#import "IYAlertViewAction.h"

@interface NSCBAlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation NSCBAlertWrapper

#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock)
        self.completionBlock(alertView, buttonIndex);
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    // Just simulate a cancel button click
    if (self.completionBlock)
        self.completionBlock(alertView, alertView.cancelButtonIndex);
}

@end

static const char kNSCBAlertWrapper;
static NSString *BUTTON_ASS_KEY = @"com.example.iyalertview.BUTTONS";
@implementation UIAlertView (Completion)

#pragma mark - Class Public

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion
{
    NSCBAlertWrapper *alertWrapper = [[NSCBAlertWrapper alloc] init];
    alertWrapper.completionBlock = completion;
    self.delegate = alertWrapper;
    
    // Set the wrapper as an associated object
    objc_setAssociatedObject(self, &kNSCBAlertWrapper, alertWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // Show the alert as normal
    [self show];
}

- (NSInteger)addButtonItemWithAlertAction:(IYAlertViewAction *)alertAction
{
    NSInteger buttonIndex = [self addButtonWithTitle:alertAction.title];
    [[self buttonItems] addObject:alertAction];
    
    if (![self delegate])
    {
        [self setDelegate:self];
    }
    
    return buttonIndex;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // If the button index is -1 it means we were dismissed with no selection
    if (buttonIndex >= 0)
    {
        NSArray *buttonsArray = objc_getAssociatedObject(self, (__bridge const void *)BUTTON_ASS_KEY);
        IYAlertViewAction *alertAction = [buttonsArray objectAtIndex:buttonIndex];
        if(alertAction.actionHandler) {
            alertAction.actionHandler(self);
        }
    }
    
    objc_setAssociatedObject(self, (__bridge const void *)BUTTON_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)buttonItems
{
    NSMutableArray *buttonItems = objc_getAssociatedObject(self, (__bridge const void *)BUTTON_ASS_KEY);
    if (!buttonItems)
    {
        buttonItems = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)BUTTON_ASS_KEY, buttonItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return buttonItems;
}

@end
