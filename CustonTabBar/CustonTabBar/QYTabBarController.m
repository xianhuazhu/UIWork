//
//  QYTabBarController.m
//  CustonTabBar
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface QYTabBarController ()
@property (nonatomic, strong) UIView *underView;

@end

@implementation QYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //1.绑定TabBarController管理的控制器
    [self setupViewControllers];
    //2. 自定义tabBar
    [self customTabBar];
}

- (void)setupViewControllers
{
    UIViewController *homeVC =[[UIViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *msgVC =[[UIViewController alloc] init];
    msgVC.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *findVC =[[UIViewController alloc] init];
    findVC.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *meVC =[[UIViewController alloc] init];
    meVC.view.backgroundColor = [UIColor redColor];
    
    self.viewControllers = @[homeVC, msgVC, findVC, meVC];
}

- (void)customTabBar
{
    //1.往self.view上添加mock tabber的背景视图bgView
    UIImageView *bgView =[[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenH-49, kScreenW, 49)];
    //图片视图默认不能交互
    bgView.userInteractionEnabled = YES;
    UIImage *img = [UIImage imageNamed:@""];
    UIImage *bgImage = [img resizableImageWithCapInsets:UIEdgeInsetsMake(21, 1, 21, 1) resizingMode:UIImageResizingModeStretch];
    bgView.image = bgImage;
    [self.view addSubview:bgView];
    
    //2.往bgView上添加underView视图
    CGFloat margin = 20;
    CGFloat underViewW = 52;
    CGFloat underViewH = 42;
    CGFloat underViewX = margin;
    CGFloat underViewY = (49 - underViewH) / 2;
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(underViewX, underViewY, underViewW, underViewH)];
    underView.backgroundColor = [UIColor cyanColor];
    underView.alpha = 0.3;
    underView.layer.cornerRadius = 6;
    [bgView addSubview:underView];
    _underView = underView;
    
    //3.往bgView上添加4个按钮
    CGFloat buttonW = 40;
    CGFloat buttonH = 50;
    CGFloat space = (kScreenW - 2*margin - 4*buttonW) / 3;
    for (int i = 0; i < 4; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonW, buttonH)];
        CGPoint underViewCenter = underView.center;
        CGPoint center = CGPointMake(underViewCenter.x + i * (space + buttonW), underViewCenter.y) ;
        button.center = center;
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
        button.tag = 1;
        [bgView addSubview:button];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)changeViewController:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
    [UIView animateWithDuration:0.3 animations:^{
        _underView.center = sender.center;
    }];
}

@end
