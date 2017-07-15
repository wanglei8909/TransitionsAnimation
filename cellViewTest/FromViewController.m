//
//  FromViewController.m
//  cellViewTest
//
//  Created by 王蕾 on 2016/12/22.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import "FromViewController.h"
#import "mTableViewCell.h"
#import "ToViewController.h"
#import "MyPageViewController.h"

@interface FromViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *fonts;
@property (nonatomic, strong) UIRefreshControl *refreshcontrol;
@end

@implementation FromViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    NSLog(@"viewWillAppear:1");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:1");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear:1");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear:1");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"FromVC";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    
//    _control=[[UIRefreshControl alloc]init];
//    
//    [self.tableView addSubview:_control];
//    
//    [_control addTarget:self action:@selector(refresh)forControlEvents:UIControlEventValueChanged];
//    
//    
    
    NSArray *array = [UIFont familyNames];
    self.fonts = [[NSArray alloc] initWithArray:array];
    
    [self.tableView reloadData];
//    UIImage *image = [UIImage imageNamed:@"bg@2x.jpg"];
//    NSData *imagedata = [UIImagePNGRepresentation(image) base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
//   
//    NSLog(@"%@",imagedata);
}

- (void)refresh{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fonts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"mTableViewCell.h";
    mTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[mTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    cell.contentView.backgroundColor = [UIColor clearColor];

    if (indexPath.row%2==0) {
        cell.contentView.backgroundColor = [UIColor brownColor];
    }
    //[cell loadContent];
    cell.textLabel.text = [self.fonts objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    ToViewController *ctrl = [[ToViewController alloc] init];
////    [self.navigationController pushViewController:ctrl animated:YES];
//    [self presentViewController:ctrl animated:YES completion:nil];
    
    MyPageViewController *mPageViewController = [[MyPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
//    ToViewController *ctrl1 = [[ToViewController alloc] init];
//    ToViewController *ctrl2 = [[ToViewController alloc] init];
//    ctrl2.view.backgroundColor = [UIColor yellowColor];
//    ToViewController *ctrl3 = [[ToViewController alloc] init];
//    ctrl3.view.backgroundColor = [UIColor brownColor];
//    [mPageViewController setViewControllers:@[ctrl1] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
//    
    [self presentViewController:mPageViewController animated:YES completion:nil];
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
