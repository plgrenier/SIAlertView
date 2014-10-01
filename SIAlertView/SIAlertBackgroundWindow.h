//
//  SIAlertBackgroundWindow.h
//  SIAlertView
//
//  Created by Kevin Cao on 13-4-29.
//  Copyright (c) 2013年 Sumi Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SIAlertViewBackgroundStyle) {
    SIAlertViewBackgroundStyleGradient,
    SIAlertViewBackgroundStyleSolid,
    SIAlertViewBackgroundStyleClear
};


@interface SIAlertBackgroundWindow : UIWindow

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame andStyle:(SIAlertViewBackgroundStyle)style;

@end
