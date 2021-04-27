//
//  ViewControllerJumpManager.m
//  yilinke
//
//  Created by 翁武勇 on 17/1/17.
//  Copyright © 2017年 yilinke. All rights reserved.
//

#import "ViewControllerJumpManager.h"
@implementation ViewControllerJumpManager

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentViewControoler {
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    UIViewController* currentViewController = window.rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else {
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            } else if ([currentViewController isKindOfClass:[UISplitViewController class]]) {
                // 当需要兼容 Ipad 时 currentViewController = currentViewController.presentingViewController;
            } else {
                if (currentViewController.presentingViewController) {
                    currentViewController = currentViewController.presentingViewController;
                } else {
                    return currentViewController;
                }
            }
        }
    }
    return currentViewController;
}

// 当我们有正在呈现的视图控制器子 View 时, 可通过属性 nextResponder 递归查找
+ (nullable UIViewController *)findBelongViewControllerForView:(UIView *)view {
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]]) {
            return (UIViewController *)responder;
        }
    return nil;
}

@end
