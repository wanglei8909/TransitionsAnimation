//
//  LXVCAnimatedTransition.h
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/22.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LXVCAnimatedTransitionType) {
    LXVCAnimatedTransitionPresent = 0,
    LXVCAnimatedTransitionDismiss
};

@interface LXVCAnimatedTransition : NSObject<UIViewControllerAnimatedTransitioning>


+ (instancetype)transitionWithType:(LXVCAnimatedTransitionType)type;
- (instancetype)initWithTransitionType:(LXVCAnimatedTransitionType)type;

@end
