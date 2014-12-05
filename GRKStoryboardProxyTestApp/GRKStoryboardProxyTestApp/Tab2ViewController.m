//
//  Tab2ViewController.m
//  GRKStoryboardProxyTestApp
//
//  Created by Levi Brown on 12/5/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import "Tab2ViewController.h"
#import "Notifications.h"

@implementation Tab2ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Main", @"Tab 2 left bar button item title.") style:UIBarButtonItemStylePlain target:self action:@selector(mainAction:)];
}

#pragma mark - Actions

- (void)mainAction:(id)sender
{
    NSLog(@"<%@> mainAction:", NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] postNotificationName:kGRKStoryboardProxyTestAppNotificationDismissToMain object:self];
}

@end
