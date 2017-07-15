//
//  BaseViewController.m
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/22.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import "BaseViewController.h"
#import "LXVCAnimatedTransition.h"
#import "LXinteractiveTransition.h"

@interface BaseViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) LXinteractiveTransition *interactiveTransition;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.interactiveTransition = [LXinteractiveTransition interactiveTransitionWithTransitionType:LXinteractiveTransitionTypeDismiss GestureDirection:LXinteractiveTransitionGestureDirectionRight];
    [self.interactiveTransition addPanGestureForViewController:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [LXVCAnimatedTransition transitionWithType:LXVCAnimatedTransitionPresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [LXVCAnimatedTransition transitionWithType:LXVCAnimatedTransitionDismiss];
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
//    
//}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return _interactiveTransition.interation ? _interactiveTransition : nil;
}



//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
//    
//}

//- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                            animationControllerForOperation:(UINavigationControllerOperation)operation
//                                                         fromViewController:(UIViewController *)fromVC
//                                                           toViewController:(UIViewController *)toVC  {
//    return [LXVCAnimatedTransition transitionWithType:(operation == UINavigationControllerOperationPush ? LXVCAnimatedTransitionPush : LXVCAnimatedTransitionPop)];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
