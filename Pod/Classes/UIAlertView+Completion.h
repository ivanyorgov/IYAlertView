//
//  UIAlertView+Completion.h
//  Comeleo
//
//  Created by Ivan Yorgov on 08.07.14.
//  Copyright (c) 2014 г. Osceola SWD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IYAlertViewAction;

@interface UIAlertView (Completion)

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;
- (NSInteger)addButtonItemWithAlertAction:(IYAlertViewAction *)alertAction;

@end
