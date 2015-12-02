//
//  ViewController.m
//  02-相册
//
//  Created by qingyun on 15/12/1.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#import "QYZoomScrollView.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define Count 3

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScrollView];
    
    [self addZoomScrollViewForScrollView];

    // Do any additional setup after loading the view, typically from a nib.
}

//添加滚动的scrollView
- (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + 25, QYScreenH)];
    [self.view addSubview:scrollView];
    
    //设置contentSize
    scrollView.contentSize = CGSizeMake((QYScreenW + 25) * Count, QYScreenH);
    //设置代理
    scrollView.delegate = self;
    //设置分页
    scrollView.pagingEnabled = YES;
    //设置背景颜色
    scrollView.backgroundColor = [UIColor blackColor];
    
    _scrollView = scrollView;
}

//添加滚动的视图（用于缩放的scrollView）
- (void)addZoomScrollViewForScrollView
{
    for (int i = 0; i < Count; i++) {
        QYZoomScrollView *zoomScrollView = [[QYZoomScrollView alloc] initWithFrame:CGRectMake(QYScreenW * i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:zoomScrollView];
        
        //设置zoomScrollView的imageView的image
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d@2x",i + 1];
        zoomScrollView.img = [UIImage imageNamed:imageName];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id object in scrollView.subviews) {
        if ([object isKindOfClass:[scrollView class]]) {
            UIScrollView *scroll = (UIScrollView *)object;
            scroll.zoomScale = 1.0;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
