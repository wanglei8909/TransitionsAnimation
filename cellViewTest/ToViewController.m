//
//  ToViewController.m
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/22.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import "ToViewController.h"
#import "ThreeViewController.h"

@interface ToViewController ()

@property (nonatomic, strong)UIPageViewController *mPageViewController;

@end

@implementation ToViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    NSLog(@"viewWillAppear:2");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:2");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear:2");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear:2");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ToVC";
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 25);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.tag = 100;
    [btn setTitle:@"上一个" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 25);
    btn.center = CGPointMake(self.view.center.x - 100, self.view.center.y + 150);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"下一个" forState:UIControlStateNormal];
    btn.tag = 101;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
//    @property(nonatomic) BOOL adjustsFontSizeToFitWidth;         // default is NO
//    @property(nonatomic) UIBaselineAdjustment baselineAdjustment; // default is UIBaselineAdjustmentAlignBaselines
//    @property(nonatomic) CGFloat minimumScaleFactor
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    label.backgroundColor = [UIColor magentaColor];
    label.textColor = [UIColor blackColor];
    label.highlightedTextColor = [UIColor whiteColor];
    label.text = @"测试测试测试测试";
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.8;
    label.highlighted = YES;
    [self.view addSubview:label];
    
    self.mPageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator{
    [self.view setNeedsLayout];
}

- (void)btnClick:(UIButton *)sender{
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        ToViewController *tCtrl = [[ToViewController alloc] init];
        [self.navigationController pushViewController:tCtrl animated:YES];
        [self presentViewController:tCtrl animated:YES completion:nil];
        
//        [UIView animateWithDuration:0.1 animations:^{
//            sender.transform = CGAffineTransformScale(sender.transform, 0.5, 0.5);
//            sender.frame = CGRectMake(sender.frame.origin.x + 50, sender.frame.origin.y, sender.frame.size.width, sender.frame.size.height);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.18 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
//                sender.transform = CGAffineTransformScale(sender.transform, 2, 2);
//                sender.frame = CGRectMake(sender.frame.origin.x + 50, sender.frame.origin.y, sender.frame.size.width, sender.frame.size.height);
//            } completion:^(BOOL finished) {
//                
//            }];
//
//        }];
        
    }
}

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
