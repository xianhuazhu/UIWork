//
//  ViewController.m
//  02-UIScrollViewDemo
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置scrollerView的背景
    _scrollView.backgroundColor = [UIColor redColor];
    
    //设置contentsize
    _scrollView.contentSize = _imageView.frame.size;
    
    //设置内容的偏移量
    //_scrollView.contentOffset = CGPointMake(-100, -50);
    
    //在原有的基础上更改滚动视图的区域
    //_scrollView.contentInset = UIEdgeInsetsMake(100, 100, 0, 0);
    
    //锁定方向
    _scrollView.directionalLockEnabled = YES;
    
    //超出边界，反弹效果
    _scrollView.bounces = YES;
    
    //假如是yes并且bounces是yes,甚至如果内容大小小于bounds的时候，允许拖动
//    _scrollView.alwaysBounceVertical = YES;
//    _scrollView.alwaysBounceHorizontal = YES;
    
    //分页
    //_scrollView.pagingEnabled = YES;
    
    //允许滚动
    //_scrollView.scrollEnabled = NO;
    
    //显示滚动条
    _scrollView.showsHorizontalScrollIndicator = YES;
    
    //滚动条位置
    _scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(100, 0, 0, 0);
    
    //滚动条样式
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    //设置减速率
    _scrollView.decelerationRate = 100;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
