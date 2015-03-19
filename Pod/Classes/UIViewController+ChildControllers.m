//
//  UIViewController+ChildControllers.m
//  MerchantsMobile
//
//  Created by Martín Fernández on 2/1/15.
//  Copyright (c) 2015 Todo Pagos. All rights reserved.
//

#import "UIViewController+ChildControllers.h"

@implementation UIViewController (ChildControllers)

#pragma mark - Frames Support

- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
                       atFrame:(CGRect)frame {
  [childController willMoveToParentViewController:self];

  [self addChildViewController:childController];
  childController.view.frame = frame;

  [view addSubview:childController.view];

  [view layoutIfNeeded];

  [childController didMoveToParentViewController:self];
}

#pragma mark - Constraints Support

- (void)presentChildController:(UIViewController *)childController inView:(UIView *)view {
  [self presentChildController:childController
                        inView:view
              constraintsBlock:^(UIView *containerView, UIView *newView) {
                [containerView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:containerView
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0
                                                                           constant:0.f]];

                [containerView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:containerView
                                                                          attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0
                                                                           constant:0.f]];

                [containerView addConstraint: [NSLayoutConstraint constraintWithItem:newView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:containerView
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:0.f]];

                [containerView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:containerView
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0
                                                                           constant:0.f]];
  } animateWithDuration:0 animationBlock:nil];
}

- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock {
  [self presentChildController:childController
                        inView:view
              constraintsBlock:constraintsBlock
           animateWithDuration:0
                animationBlock:nil];
}

- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock
           animateWithDuration:(NSTimeInterval)duration
                animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock {
  [self presentChildController:childController
                        inView:view
              constraintsBlock:constraintsBlock
           animateWithDuration:duration
                animationBlock:animationBlock
               completionBlock:nil];
}

- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock
           animateWithDuration:(NSTimeInterval)duration
                animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock
               completionBlock:(void (^)(BOOL finished))completionBlock {
  [childController willMoveToParentViewController:self];

  [self addChildViewController:childController];
  [view addSubview:childController.view];

  childController.view.translatesAutoresizingMaskIntoConstraints = NO;

  constraintsBlock(view, childController.view);
  [view layoutIfNeeded];

  if (!animationBlock) {
    [childController didMoveToParentViewController:self];
    return;
  }

  [UIView animateWithDuration:duration animations:^{
    animationBlock(view, childController.view);
    [view layoutIfNeeded];
  } completion:^(BOOL finished) {
    [childController didMoveToParentViewController:self];
    if (completionBlock) { completionBlock(finished); }
  }];
}

- (void)dismissChildViewController:(UIViewController *)childController {
  [self dismissChildViewController:childController
               animateWithDuration:0
                    animationBlock:nil
                   completionBlock:nil];
}

- (void)dismissChildViewController:(UIViewController *)childController
               animateWithDuration:(NSTimeInterval)duration
                    animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock
                   completionBlock:(void (^)(BOOL finished))completionBlock {
  [childController willMoveToParentViewController:nil];
  [childController removeFromParentViewController];

  if (!animationBlock) {
    [childController.view removeFromSuperview];
    [childController didMoveToParentViewController:nil];
    return;
  }

  [UIView animateWithDuration:duration animations:^{
    animationBlock(self.view, childController.view);
    [self.view layoutIfNeeded];
  } completion:^(BOOL finished) {
    [childController.view removeFromSuperview];
    [childController didMoveToParentViewController:nil];
    if (completionBlock) { completionBlock(finished); }
  }];
}

@end
