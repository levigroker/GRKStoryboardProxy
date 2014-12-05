//
//  Segue1ViewController.m
//  GRKStoryboardProxyTestApp
//
//  Created by Levi Brown on 12/4/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import "Segue1ViewController.h"
#import "Notifications.h"

@interface Segue1ViewController ()

- (IBAction)dismissAction:(id)sender;

@end

@implementation Segue1ViewController

- (IBAction)dismissAction:(id)sender
{
    NSLog(@"<%@> dismissAction:", NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] postNotificationName:kGRKStoryboardProxyTestAppNotificationDismissToMain object:self];
}

@end
