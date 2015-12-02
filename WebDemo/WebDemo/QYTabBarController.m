//
//  QYViewController.m
//  WebDemo
//
//  Created by qingyun on 15/11/26.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

#import "QYDisCoverViewController.h"
#import "QYHomeViewController.h"
#import "QYMessageViewController.h"
#import "QYMeViewController.h"

@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //绑定试图控制器
    [self bindViewController];
    
    [self setTabBar];
}

- (void)setTabBar
{
    //self.tabBar.tintColor = [UIColor colorWithRed:94/255.0  green:211/255.0 blue:44/255.0 alpha:1.0];
    self.tabBar.tintColor = [UIColor orangeColor];
    //添加➕
    CGFloat tabBarItermW = 50;
    CGFloat tabBarItermH = 40;
    CGFloat tabBarItermX = self.tabBar.center.x - tabBarItermW/2;
    CGFloat tabBarItermY = (49 - tabBarItermH)/2;
    
    UIButton *tabBarIterm = [UIButton buttonWithType:UIButtonTypeCustom];
    tabBarIterm.frame = CGRectMake(tabBarItermX, tabBarItermY, tabBarItermW, tabBarItermH);
    [tabBarIterm setBackgroundColor:[UIColor orangeColor]];
    
    [self.tabBar addSubview:tabBarIterm];
    
    [tabBarIterm setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [tabBarIterm addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)addButton:(UIButton *)btn
{
    NSLog(@"加号");
}

- (void)bindViewController
{
    QYHomeViewController *homeVC = [[QYHomeViewController alloc] init];
    UINavigationController *first = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    QYMessageViewController *messageVC = [[QYMessageViewController alloc] init];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    QYDisCoverViewController *disCoverVC = [[QYDisCoverViewController alloc] init];
    UINavigationController *third = [[UINavigationController alloc] initWithRootViewController:disCoverVC];
    
    QYMeViewController *meVC = [[QYMeViewController alloc] init];
    UINavigationController *fourth = [[UINavigationController alloc] initWithRootViewController:meVC];
    
    UIViewController *tempVC = [[UIViewController alloc] init];
    
    NSArray *viewControllers = @[first, second, tempVC, third, fourth];
    self.viewControllers = viewControllers;
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
