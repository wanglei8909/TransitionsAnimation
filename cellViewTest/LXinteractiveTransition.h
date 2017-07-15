//
//  LXinteractiveTransition.h
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/23.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)();

typedef NS_ENUM(NSUInteger, LXinteractiveTransitionGestureDirection) {//手势的方向
    LXinteractiveTransitionGestureDirectionLeft = 0,
    LXinteractiveTransitionGestureDirectionRight,
    LXinteractiveTransitionGestureDirectionUp,
    LXinteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, LXinteractiveTransitionType) {//手势控制哪种转场
    LXinteractiveTransitionTypePresent = 0,
    LXinteractiveTransitionTypeDismiss,
    LXinteractiveTransitionTypePush,
    LXinteractiveTransitionTypePop,
};

@interface LXinteractiveTransition : UIPercentDrivenInteractiveTransition

/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

//初始化方法

+ (instancetype)interactiveTransitionWithTransitionType:(LXinteractiveTransitionType)type
                                       GestureDirection:(LXinteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(LXinteractiveTransitionType)type
                      GestureDirection:(LXinteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;


@end



