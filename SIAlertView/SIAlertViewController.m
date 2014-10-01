//
//  SIAlertViewController.m
//  SIAlertView
//
//  Created by Kevin Cao on 13-4-29.
//  Copyright (c) 2013年 Sumi Interactive. All rights reserved.
//

#import "SIAlertViewController.h"
#import "SIAlertView.h"

@interface SIAlertViewController ()

@end



@implementation SIAlertViewController

#pragma mark - View lifecycle
- (void)loadView
{
    [super loadView];
    self.view = self.alertView;

    // iOS 6
    //self.wantsFullScreenLayout = YES;
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

/*- (BOOL)prefersStatusBarHidden
{
    return YES;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.alertView setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"** didReceiveMemoryWarning **");
}

#pragma mark - View rotation

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.alertView resetTransition];
    [self.alertView invalidateLayout];
}

@end
