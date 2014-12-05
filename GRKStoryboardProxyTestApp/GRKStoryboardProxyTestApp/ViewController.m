//
//  ViewController.m
//  GRKStoryboardProxyTestApp
//
//  Created by Levi Brown on 12/4/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import "ViewController.h"
#import "Notifications.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissToMainNotification:) name:kGRKStoryboardProxyTestAppNotificationDismissToMain object:nil];
}

#pragma mark - Notifications

- (void)dismissToMainNotification:(NSNotification *)notification
{
    NSLog(@"<%@> dismissToMainNotification:", NSStringFromClass([self class]));
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
