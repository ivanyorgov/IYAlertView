# IYAlertView

[![CI Status](http://img.shields.io/travis/ivan yorgov/IYAlertView.svg?style=flat)](https://travis-ci.org/ivan yorgov/IYAlertView)
[![Version](https://img.shields.io/cocoapods/v/IYAlertView.svg?style=flat)](http://cocoadocs.org/docsets/IYAlertView)
[![License](https://img.shields.io/cocoapods/l/IYAlertView.svg?style=flat)](http://cocoadocs.org/docsets/IYAlertView)
[![Platform](https://img.shields.io/cocoapods/p/IYAlertView.svg?style=flat)](http://cocoadocs.org/docsets/IYAlertView)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

IYAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "IYAlertView"
    
## Sample usage

Create action for a button in the alert
```Objective-C
    IYAlertViewAction *alertActionDefault = [IYAlertViewAction alertActionWithType:kAlertTypeDefault
                                                                             title:@"Button title"
                                                                        andHandler:^(id alert) {
                                                                            //Do something after a button was pressed
                                                                        }];
```

Present alert with a default action - button with title "OK".
```Objective-C
[IYAlertView presentAlertWithTitle:@"Title"
                               message:@"Message"
                            andActions:nil
                         inViewContext:self.view];
```
```Objective-C
IYAlertViewAction *alertActionDefault = [IYAlertViewAction alertActionWithType:kAlertTypeDefault
                                                                            title:@"Button title"
                                                                        andHandler:^(id alert) {
                                                                            //Do something after a button was pressed
                                                                        }];
IYAlertViewAction *alertActionDestructive = [IYAlertViewAction alertActionWithType:kAlertTypeDestructive
                                                                            title:@"Cancel"
                                                                        andHandler:^(id alert) {
                                                                            //Do something after a button was pressed
                                                                        }];

[IYAlertView presentAlertWithTitle:@"Title"
                               message:@"Message"
                            andActions:@[alertActionDefault, alertActionDestructive]
                         inViewContext:self.view];
```


## Author

ivan yorgov, stubborn@mail.bg

## License

IYAlertView is available under the MIT license. See the LICENSE file for more info.

