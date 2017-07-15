//
//  LXVCAnimatedTransition.m
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/22.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import "LXVCAnimatedTransition.h"
#import "BaseViewController.h"

@interface LXVCAnimatedTransition()

@property (nonatomic, assign) LXVCAnimatedTransitionType type;

@end

@implementation LXVCAnimatedTransition

+ (instancetype)transitionWithType:(LXVCAnimatedTransitionType)type{
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(LXVCAnimatedTransitionType)type{
    self = [super init];
    if (self) {
        self.type = type;
        
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case LXVCAnimatedTransitionPresent:
            [self doPresentAnimation:transitionContext];
            break;
        case LXVCAnimatedTransitionDismiss:
            [self doDismissAnimation:transitionContext];
            break;
            
        default:
            break;
    }
}

//实现push动画逻辑代码
- (void)doPresentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"pushAnimation-->%ld",(long)transitionContext.presentationStyle);
    
    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    //加一个黑色背景
    UIView *blackView = [[UIView alloc] initWithFrame:containerView.frame];
    blackView.backgroundColor = [UIColor blackColor];
    [containerView addSubview:blackView];
    
    //snapshotViewAfterScreenUpdates 对cell的imageView截图保存成另一个视图用于过渡，并将视图转换到当前控制器的坐标
    UIImage *image = [self imageFromView:fromVC.view];
    UIImageView *tempView = [[UIImageView alloc] initWithImage:image];
    tempView.frame = fromVC.view.frame;
    tempView.tag = 102;
    UIView *maskView = [[UIView alloc] initWithFrame:tempView.bounds];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.tag = 103;
    maskView.alpha = 0;
    //设置动画前的各个控件的状态
    
    CGRect tFrame = CGRectMake(toVC.view.frame.size.width, toVC.view.frame.origin.y, toVC.view.frame.size.width, toVC.view.frame.size.height);
    toVC.view.frame = tFrame;
    //tempView 添加到containerView中，要保证在最前方，所以后添加
    [containerView addSubview:tempView];
    [containerView addSubview:maskView];
    [containerView addSubview:toVC.view];
    NSLog(@"%@",containerView.subviews);
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        tempView.transform = CGAffineTransformMakeScale(0.9,0.9);
        toVC.view.transform = CGAffineTransformMakeTranslation(-toVC.view.frame.size.width, 0);
        maskView.alpha = 0.8;
    } completion:^(BOOL finished) {

        //如果动画过渡取消了就标记不完成，否则才完成，这里可以直接写YES，如果有手势过渡才需要判断，必须标记，否则系统不会中动画完成的部署，会出现无法交互之类的bug
        [transitionContext completeTransition:YES];
    }];
}
//实现pop动画逻辑代码
- (void)doDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    NSLog(@"popAnimation");
    
    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    NSArray *subviewsArray = containerView.subviews;
//    UIView *tempView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];
//    UIView *maskView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 1))];
    UIView *tempView = [containerView viewWithTag:102];
    UIView *maskView = [containerView viewWithTag:103];

    NSLog(@"%@",containerView.subviews);
   
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        fromVC.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
        maskView.alpha = 0;
    } completion:^(BOOL finished) {
        
        //如果动画过渡取消了就标记不完成，否则才完成，这里可以直接写YES，如果有手势过渡才需要判断，必须标记，否则系统不会中动画完成的部署，会出现无法交互之类的bug
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        //转场失败后的处理
        if ([transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            //然后移除截图视图，因为下次触发present会重新截图
            
        }
    }];
    
}

- (UIImage *)imageFromView:(UIView *)snapView {
    UIGraphicsBeginImageContextWithOptions(snapView.frame.size, NO, 0.0);
    //UIGraphicsBeginImageContext(snapView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [snapView.layer renderInContext:context];
    UIImage *targetImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return targetImage;
}

@end



















