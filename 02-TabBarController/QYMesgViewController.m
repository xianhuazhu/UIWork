//
//  QYMesgViewController.m
//  02-TabBarController
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYMesgViewController.h"

@implementation QYMesgViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//        UIImage *image = [UIImage imageNamed:@"信件1.png"];
//        UIImage *imgHighted = [UIImage imageNamed:@"信件2.png"];
//        UITabBarItem *tabBarIterm = [[UITabBarItem alloc] initWithTitle:nil image:image selectedImage:imgHighted];
        self.tabBarItem = tabBarItem;
        tabBarItem.badgeValue = [@3 stringValue];
        
        self.title = @"消息";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}
@end
