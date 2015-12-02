//
//  ViewController.m
//  UIScrolView
//
//  Created by qingyun on 15/11/25.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _scrollView.contentSize = CGSizeMake(kScreenW, kScreenH);
    _scrollView.directionalLockEnabled = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(100, 100, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
