//
//  ViewController.m
//  UIPageControl
//
//  Created by qingyun on 15/11/27.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:pageControl];
    
    //设置背景颜色
    pageControl.backgroundColor = [UIColor greenColor];
    
    //设置当前总页数
    pageControl.numberOfPages = 7;
    //设置当前页数
    pageControl.currentPage = 3;
    //着色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    //当前页着色
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    //设置延迟显示页码,设置成yes要手动调用defersCurrentPageDisplay
    pageControl.defersCurrentPageDisplay = YES;
    
    [pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pageControlClick:(UIPageControl *)pageControl
{
    //刷新视图，更改当前显示的页码
    [pageControl updateCurrentPageDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
