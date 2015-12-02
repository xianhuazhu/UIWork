//
//  QYZoomScrollView.m
//  02-相册
//
//  Created by qingyun on 15/12/1.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYZoomScrollView.h"

@interface QYZoomScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation QYZoomScrollView

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加缩放视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        
        _imageView = imageView;
        
        //设置当前ScrollView的属性（代理、缩放的范围）
        self.delegate = self;
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.5;
        
        //添加双击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        tap.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)doubleClick:(UITapGestureRecognizer *)tap
{
    //当前的缩放比例不等于1.0
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    //当前的缩放比例等于1.0
    CGPoint tapPoint = [tap locationInView:self];
    
    //创建一个矩形区域（宽：200）（高：200）
    CGRect rect = CGRectMake(tapPoint.x - 100, tapPoint.y - 100, 200, 200);
    [self zoomToRect:rect animated:YES];
}

//设置imageView的image
- (void)setImg:(UIImage *)img
{
    //设置_img属性
    _img = img;
    //设置imageView的image
    _imageView.image = img;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
