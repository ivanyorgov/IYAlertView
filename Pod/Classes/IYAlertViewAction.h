//
//  ComeleoAlertAction.h
//  Comeleo
//
//  Created by Ivan Yorgov on 01.10.14.
//  Copyright (c) 2014 г. Osceola SWD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kAlertTypeDefault = 0,
    kAlertTypeCancel,
    kAlertTypeDestructive,
} alertActionType;

typedef void(^AlertCallback)(id alert);

@interface IYAlertViewAction : NSObject

@property (nonatomic) NSUInteger actionType;
@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) AlertCallback actionHandler;

+ (IYAlertViewAction *)alertActionWithType:(NSUInteger)actionType title:(NSString *)title andHandler:(AlertCallback)actionHandler;
+ (IYAlertViewAction *)defaultAction;

@end
