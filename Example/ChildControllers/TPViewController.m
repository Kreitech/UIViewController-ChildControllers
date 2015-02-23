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

  UIViewController *c = [UIViewController new];

  c.view.backgroundColor = [UIColor redColor];

  UIView *v = [[UIView alloc] initWithFrame:self.view.frame];

  [self.view addSubview:v];
  [self presentChildController:c inView:v];
}

@end
