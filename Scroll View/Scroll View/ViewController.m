//
//  ViewController.m
//  Scroll View
//
//  Created by qingyun on 15/11/27.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView.contentSize = CGSizeMake(1200, 667);
    _scrollView.backgroundColor = [UIColor blackColor];
    
    //对scrollView进行分页
    _scrollView.pagingEnabled = YES;
    _pageControl.numberOfPages = 3;
    _scrollView.delegate = self;
    
    //对pageControl添加事件监听
    [_pageControl addTarget:self action:@selector(changePageControl:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
    //设置有效点击数
    tap.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tap];
    
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.bouncesZoom = NO;
    
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"zoomScale:%f",scrollView.zoomScale);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"dxfcvgbhnjmkl,;.'");
    return _imageView;
}

- (void)doubleClick:(UITapGestureRecognizer *)tap
{
    UIScrollView *zoomScrolllView = (UIScrollView *)tap.view;
    if (zoomScrolllView.zoomScale != 1.0) {
        zoomScrolllView.zoomScale = 1.0;
        return;
    }
    if (tap.numberOfTapsRequired) {
        CGPoint point = [tap locationInView:_scrollView];
        CGRect rect = CGRectMake(point.x-100, point.y-100, 200, 200);
        [_scrollView zoomToRect:rect animated:YES];
    }
}

- (void)changePageControl:(UIPageControl *)pageControl
{
    //计算偏移量
    CGPoint offset = CGPointMake(_pageControl.currentPage * (_scrollView.frame.size.width + 25), 0);
    _scrollView.contentOffset = offset;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / (scrollView.frame.size.width + 25);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
