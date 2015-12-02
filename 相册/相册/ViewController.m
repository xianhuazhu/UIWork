//
//  ViewController.m
//  相册
//
//  Created by qingyun on 15/11/30.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageViewCount 3

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addScrollView];
    [self addContentForScrollView];
}

- (void)addScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + 25, QYScreenH)];
    [self.view addSubview:scrollView];
    
    //设置contensize
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * ImageViewCount, scrollView.frame.size.height);
    //分页
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
    //设置背景
    scrollView.backgroundColor = [UIColor blackColor];
    
    _scrollView = scrollView;
}

//添加滚动ScrollView的内容
- (void)addContentForScrollView
{
    for (int i = 0; i < ImageViewCount; i++) {
        UIScrollView *zoomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((QYScreenW + 25) * i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:zoomScrollView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, QYScreenH)];
        [zoomScrollView addSubview:imageView];
        
        //设置图片
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d@2x.png", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        //设置代理
        zoomScrollView.delegate = self;
        //缩放比例范围
        zoomScrollView.maximumZoomScale = 2;
        zoomScrollView.minimumZoomScale = 0.5;
        
        //设置imageView的tag
        imageView.tag = 100;
        
        //添加双击
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        
        //有效点击次数
        tap.numberOfTapsRequired = 2;
        [zoomScrollView addGestureRecognizer:tap];
    }
}

//双击缩放
- (void)doubleClick:(UITapGestureRecognizer *)tap
{
    //获取缩放的scrollView
    UIScrollView *zoomScrollView = (UIScrollView *)tap.view;
    //判断当前zoomScrollView的缩放比例，如果不等于1，还原
    if (zoomScrollView.zoomScale != 1.0) {
        zoomScrollView.zoomScale = 1.0;
        return;
    }
    
    //zoomScrollView的缩放比例等于1
    CGPoint tapPoint = [tap locationInView:zoomScrollView];
    
    //创建一个矩形区域（宽：200，高：200）
    CGRect rect = CGRectMake(tapPoint.x - 100, tapPoint.y - 100, 200, 200);
    [zoomScrollView zoomToRect:rect animated:YES];
}

#pragma mark -缩放内容视图
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
