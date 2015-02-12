//
//  ComeleoAlertAction.m
//  Comeleo
//
//  Created by Ivan Yorgov on 01.10.14.
//  Copyright (c) 2014 г. Osceola SWD. All rights reserved.
//

#import "IYAlertViewAction.h"

@implementation IYAlertViewAction

+ (IYAlertViewAction *)alertActionWithType:(NSUInteger)actionType title:(NSString *)title andHandler:(AlertCallback)actionHandler
{
    IYAlertViewAction *alertAction = [[IYAlertViewAction alloc] init];
    
    alertAction.title = title;
    alertAction.actionType = actionType;
    alertAction.actionHandler = actionHandler;
    
    return alertAction;
}

+ (IYAlertViewAction *)defaultAction
{
    return [self alertActionWithType:kAlertTypeCancel title:NSLocalizedString(@"OK", nil) andHandler:nil];
}

@end
