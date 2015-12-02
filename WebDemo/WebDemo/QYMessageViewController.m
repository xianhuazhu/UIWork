//
//  QYMessageViewController.m
//  WebDemo
//
//  Created by qingyun on 15/11/26.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYMessageViewController.h"

@interface QYMessageViewController ()

@end

@implementation QYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarIterm = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_highlighted"]];
        self.tabBarItem = tabBarIterm;
    }
    return self;
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
