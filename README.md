# UIViewController+ChildControllers

[![CI Status](http://img.shields.io/travis/Martin Fernandez/ChildControllers.svg?style=flat)](https://travis-ci.org/bilby91/UIViewController-ChildControllers)
[![Version](https://img.shields.io/cocoapods/v/UIViewController+ChildControllers.svg?style=flat)](http://cocoadocs.org/docsets/ChildControllers)
[![License](https://img.shields.io/cocoapods/l/UIViewController+ChildControllers.svg?style=flat)](http://cocoadocs.org/docsets/ChildControllers)
[![Platform](https://img.shields.io/cocoapods/p/UIViewController+ChildControllers.svg?style=flat)](http://cocoadocs.org/docsets/ChildControllers)

## Usage

UIViewController+ChildControllers helps you out when you want to present child controllers. 

Now you don't have to remember calling `willMoveToParentViewController:` or `didMoveToParentViewController`, this will be done for you when you use this API.

The best place for looking at the documentation will be in the source code but basically this is what you can do.

First, create a view controller:

```
  UIViewController *viewControllerToPresent = [UIViewController new];
  viewControllerToPresent.view.backgroundColor = [UIColor redColor];

  UIView *containerView = [[UIView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:containerView];
```

Present the view controller with the view pined to the edges of the container view:

```
  [self presentChildController:viewControllerToPresent inView:containerView];
```

Present the view controller and setup some constraints:

```
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
```  


To run the example project, clone the repo, and run `pod install` from the Example directory first.

## TODO

[ ] Add support for setting the view with it's frame 

## Installation

ChildControllers is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UIViewController+ChildControllers"

## Author

Martin Fernandez, fmartin91@gmail.com

## License

UIViewController+ChildControllers is available under the MIT license. See the LICENSE file for more info.

