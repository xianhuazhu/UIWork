//
//  QYTabBarController.m
//  TabBarControllerCustom
//
//  Created by qingyun on 15/11/26.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface QYTabBarController ()
@property (nonatomic, strong) UIView *subView;

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hindTabBar];
    [self setTabBar];
}

- (void)hindTabBar
{
    UIViewController *first = [[UIViewController alloc] init];
    first.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *second = [[UIViewController alloc] init];
    second.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *third = [[UIViewController alloc] init];
    third.view.backgroundColor = [UIColor redColor];
    
    UIViewController *fourth = [[UIViewController alloc] init];
    fourth.view.backgroundColor = [UIColor blueColor];
    
    self.viewControllers = @[first, second, third, fourth];
}

- (void)setTabBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenH - 49, 375, 49)];
    imageView.userInteractionEnabled = YES;
    
    imageView.image = [[UIImage imageNamed:@"tabButtonBackground.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 1, 22, 1) resizingMode:UIImageResizingModeStretch];
    [self.view addSubview:imageView];
    
    CGFloat space = 5;
    CGFloat subViewW = 55;
    CGFloat subViewH = 49 - space*2;
    CGFloat mergin = 35;
//  CGFloat leftRightSpace = (kScreenW - 4 * subViewW - 3 * mergin)/2;
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(mergin, space, subViewW, subViewH)];
    subView.backgroundColor = [UIColor grayColor];
    [imageView addSubview:subView];
    subView.alpha = 0.3;
    subView.layer.cornerRadius = 10;
//    subView.userInteractionEnabled = YES;
    _subView = subView;
    
    CGFloat buttonW = 55;
    CGFloat buttonH = 39;
    CGFloat leftRightSpace = (kScreenW - 4 * subViewW - 3 * mergin)/2;
       for (int i = 0; i < 4; i ++) {
           
        CGFloat buttonX = leftRightSpace + i * buttonW + i * mergin;
        CGFloat buttonY = (49 - buttonH)/2;
        
           CGPoint subViewCenter = subView.center;
           CGPoint center = CGPointMake(subViewCenter.x + i * (leftRightSpace + buttonW), subViewCenter.y);
           subView.center = center;
           
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d@2x.png", i + 1]] forState:UIControlStateNormal];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
       // button.backgroundColor = [UIColor clearColor];
        button.tag = i;
        [imageView addSubview:button];
        
        [button addTarget:self action:@selector(changeButtonBackground:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)changeButtonBackground:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
    [UIView animateWithDuration:0.1 animations:^{
        _subView.center = sender.center;
    }];
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
