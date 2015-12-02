//
//  ViewController.m
//  UIImageViewDemo
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个火焰的imageView
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i=0; i< 17; i++) {
        NSString *imageName=[NSString stringWithFormat:@"campFire%02d.gif",i+1];
        UIImage *image =[UIImage imageNamed:imageName];
        [images addObject:image];
        
    }
    [imageView setAnimationImages:images];
    [imageView setAnimationDuration:1.75];
    [imageView setAnimationRepeatCount:0];
    
    [imageView startAnimating];
    
    //使用定时器来创建雪花
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(snowFly) userInfo:nil repeats:YES];
 
}

- (void)snowFly
{
    UIImage *image = [UIImage imageNamed:@"flake.png"];
    UIImageView *snow=[[UIImageView alloc] initWithImage:image];
    [self.view addSubview:snow];
    
    int qyScreenW=[UIScreen mainScreen].bounds.size.width;  //获取屏幕宽
    int x1=round(random()%qyScreenW);  //雪花的起始位置的x
    
    double scale=1/random()%100+1.0;  //雪花大小的倍数
    double speed=1/random()%100+1.0;  //雪花移动的速度倍数
    
    snow.frame=CGRectMake(x1, -60, 30*scale, 30*scale);  //设置雪花的起始位置和大小
    
    //雪花移动动画
    [UIView animateWithDuration:5*speed animations:^{
        int x2=round(random() % qyScreenW);    //雪花最终的位置x
        snow.frame=CGRectMake(x2, 600, 50*scale, 50*scale);  //设置雪花最终的位置和大小
    }completion:^(BOOL finished){
        [snow removeFromSuperview];    //动画结束，移除雪花
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
