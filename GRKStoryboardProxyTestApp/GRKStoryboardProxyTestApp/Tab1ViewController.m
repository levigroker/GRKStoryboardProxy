//
//  Tab1ViewController.m
//  GRKStoryboardProxyTestApp
//
//  Created by Levi Brown on 12/4/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import "Tab1ViewController.h"
#import "Notifications.h"

@interface Tab1ViewController ()

- (IBAction)mainAction:(id)sender;

@end

@implementation Tab1ViewController

#pragma mark - Actions

- (IBAction)mainAction:(id)sender
{
    NSLog(@"<%@> mainAction:", NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] postNotificationName:kGRKStoryboardProxyTestAppNotificationDismissToMain object:self];
}

@end
