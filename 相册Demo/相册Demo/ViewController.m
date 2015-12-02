//
//  ViewController.m
//  相册Demo
//
//  Created by qingyun on 15/11/30.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define Count 3

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addScrollView];
    [self zoomScroolView];
}

- (void)addScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    //设置contensize
    scrollView.contentSize = CGSizeMake(kScreenW * Count, kScreenH);
    [self.view addSubview:scrollView];
    
    //分页
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
    //设置背景
    scrollView.backgroundColor = [UIColor purpleColor];
    _scrollView = scrollView;
}

//添加滚动的scrollView的内容
- (void)zoomScroolView
{
    for (int i = 0; i < Count; i++) {
        UIScrollView *zoomScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(kScreenW * i, 0, kScreenW, kScreenH)];
        [_scrollView addSubview:zoomScroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d@2x.png",i + 1]]];
        imageView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
        [zoomScroll addSubview:imageView];
        
        //设置图片
        zoomScroll.delegate = self;
        //缩放比例范围
        zoomScroll.maximumZoomScale = 2;
        zoomScroll.minimumZoomScale = 0.5;
        
        //设置imageView的tag
        imageView.tag = 100;
        
        //添加双击
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        
        //有效点击次数
        tap.numberOfTapsRequired = 2;
        [zoomScroll addGestureRecognizer:tap];
    }
}

//双击缩放
- (void)doubleClick:(UITapGestureRecognizer *)tap{
    //获取缩放的scrollView
    UIScrollView *zoomScrollView = (UIScrollView *)tap.view;
    //判断当前zoomScrollView的缩放比例，如果不等于1，还原
    if (zoomScrollView.zoomScale != 1.0) {
        zoomScrollView.zoomScale = 1.0;
        return;
    }
    
    //zoomScrollView的缩放比例等于1
    CGPoint tapPoint = [tap locationInView:zoomScrollView];
    
    //创建一个矩形区域(宽：200，高：200)
    CGRect rect = CGRectMake(tapPoint.x - 100, tapPoint.y - 100, 200, 200);
    [zoomScrollView zoomToRect:rect animated:YES];
    
}

//缩放内容视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) return nil;
    UIImageView *imgView = (UIImageView *)[scrollView viewWithTag:100];
    return imgView;
}

//减速完成时重置所有的内容视图的缩放为1
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        for (id sc in scrollView.subviews) {
            //判断当前的sc是否为UIScrollView类型
            if ([sc isKindOfClass:[UIScrollView class]]) {
                UIScrollView *scroll = (UIScrollView *)sc;
                scroll.zoomScale = 1.0;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
