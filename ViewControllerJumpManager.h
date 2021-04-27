//
//  ViewControllerJumpManager.h
//  yilinke
//
//  Created by 翁武勇 on 17/1/17.
//  Copyright © 2017年 yilinke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EmptyBlock)(void);

@interface ViewControllerJumpManager : NSObject

+ (UIViewController *)currentViewControoler;

@end
