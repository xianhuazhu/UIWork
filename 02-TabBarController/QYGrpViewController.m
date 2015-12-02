//
//  QYGrpViewController.m
//  02-TabBarController
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYGrpViewController.h"

@implementation QYGrpViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:3];
        self.tabBarItem = tabBarItem;

        self.title = @"群组";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}
@end
