//
//  UIViewController+ChildControllers.h
//  MerchantsMobile
//
//  Created by Martín Fernández on 2/1/15.
//  Copyright (c) 2015 Todo Pagos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ChildControllers)

/**
 *  Presents the child controller talking the hole size of its containter view.
 *
 *  @param childController The controller to present
 *  @param view            The parent view for the childController view
 */
- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view;

/**
 *  Presents the child controller and allows the positioning of the view
 *  through the constraintsBlock.
 *
 *  @param childController  The controller to present
 *  @param view             The parent view for the childController view
 *  @param constraintsBlock This block will be called so you can set the position of the child controller view with constraints
 */
- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock;

/**
 *  Presents the child controller and allows the positioning of the view
 *  through the constraintsBlock. Also provides a custom animation block.
 *
 *  @param childController  The controller to present
 *  @param view             The parent view for the childController view
 *  @param constraintsBlock This block will be called so
 *  @param duration         The animation duration
 *  @param animationBlock   The animation block
 */
- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock
           animateWithDuration:(NSTimeInterval)duration
                animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock;

/**
 *  Presents the child controller and allows the positioning of the view
 *  through the constraintsBlock. Also provides a custom animation block/
 *
 *  @param childController  The controller to present
 *  @param view             The parent view for the childController view
 *  @param constraintsBlock This block will be called so
 *  @param duration         The animation duration
 *  @param animationBlock   The animation block
 *  @param completionBlock  The completion block called when the animation has finished
 */
- (void)presentChildController:(UIViewController *)childController
                        inView:(UIView *)view
              constraintsBlock:(void (^)(UIView *containerView, UIView *newView))constraintsBlock
           animateWithDuration:(NSTimeInterval)duration
                animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock
               completionBlock:(void (^)(BOOL finished))completionBlock;

/**
 *  Removes the child controller and the child controller's view from the herarchy
 *
 *  @param childController The child controller to remove
 */
- (void)dismissChildViewController:(UIViewController *)childController;

/**
 *  Removes the child controller and the child controller's view from the herarchy with an animation.
 *
 *  @param childController The child controller to remove
 *  @param duration        The animation duration
 *  @param animationBlock  The animation block
 *  @param completionBlock The completion block called when the animation has finished
 */
- (void)dismissChildViewController:(UIViewController *)childController
              animateWithDuration:(NSTimeInterval)duration
                   animationBlock:(void (^)(UIView *containerView, UIView *newView))animationBlock
                  completionBlock:(void (^)(BOOL finished))completionBlock;

@end
