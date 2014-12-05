//
//  Segue2ViewController.m
//  GRKStoryboardProxyTestApp
//
//  Created by Levi Brown on 12/4/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import "Segue2ViewController.h"
#import "Notifications.h"

@interface Segue2ViewController ()

- (IBAction)dismissAction:(id)sender;

@end

@implementation Segue2ViewController

- (IBAction)dismissAction:(id)sender
{
    NSLog(@"<%@> dismissAction:", NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] postNotificationName:kGRKStoryboardProxyTestAppNotificationDismissToMain object:self];
}

@end
