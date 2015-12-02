//
//  QYTabBarController.m
//  TabBarController
//
//  Created by qingyun on 15/11/26.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabBar];
}


- (void)setTabBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 60)];
    //UIImage *image = ;
    imageView.image = [[UIImage imageNamed:@"tabButtonBackground.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 1, 22, 1) resizingMode:UIImageResizingModeStretch];
    
    [self.view addSubview:imageView];
    
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
