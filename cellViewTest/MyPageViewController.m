//
//  MyPageViewController.m
//  cellViewTest
//
//  Created by 王蕾 on 2017/3/3.
//  Copyright © 2017年 王蕾. All rights reserved.
//

#import "MyPageViewController.h"
#import "ToViewController.h"

@interface MyPageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong)NSArray *viewControllersArray;

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ToViewController *ctrl1 = [[ToViewController alloc] init];
    ToViewController *ctrl2 = [[ToViewController alloc] init];
    ctrl2.view.backgroundColor = [UIColor yellowColor];
    ToViewController *ctrl3 = [[ToViewController alloc] init];
    ctrl3.view.backgroundColor = [UIColor brownColor];
    _viewControllersArray = @[ctrl1,ctrl2,ctrl3];
    self.delegate = self;
    self.dataSource = self;
    [self setViewControllers:@[ctrl2] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    
}

// Delegate may specify a different spine location for after the interface orientation change. Only sent for transition style 'UIPageViewControllerTransitionStylePageCurl'.
// Delegate may set new view controllers or update double-sided state within this method's implementation as well.
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return UIPageViewControllerSpineLocationMin;
}

- (UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController {
    return UIInterfaceOrientationPortrait;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    ToViewController *ctrl2 = [[ToViewController alloc] init];
    ctrl2.view.backgroundColor = [UIColor brownColor];
    return ctrl2;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    ToViewController *ctrl2 = [[ToViewController alloc] init];
    return ctrl2;
}
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    return 1;
//}
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
