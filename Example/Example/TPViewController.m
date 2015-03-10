//
//  TPViewController.m
//  ChildControllers
//
//  Created by Martin Fernandez on 02/23/2015.
//  Copyright (c) 2014 Martin Fernandez. All rights reserved.
//

#import "TPViewController.h"

#import <UIViewController+ChildControllers.h>

@interface TPViewController ()

@end

@implementation TPViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  UIViewController *viewControllerToPresent = [UIViewController new];
  viewControllerToPresent.view.backgroundColor = [UIColor redColor];

  UIView *containerView = [[UIView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:containerView];

  [self presentChildController:viewControllerToPresent inView:containerView];
  [self presentChildController:viewControllerToPresent inView:containerView constraintsBlock:^(UIView *containerView, UIView *newView) {
    [containerView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:containerView
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:3.f]];
  }];
}

@end
