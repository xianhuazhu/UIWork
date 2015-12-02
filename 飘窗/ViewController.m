//
//  ViewController.m
//  飘窗
//
//  Created by qingyun on 15/11/11.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *but1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:view1];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景.jpg"]];
    imageV.frame = CGRectMake(0, 0, 375, 667);
    [view1 addSubview:imageV];
    
    _but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _but1.frame = CGRectMake( 0, 0, 100, 100);
    _but1.backgroundColor = [UIColor redColor];
    [imageV addSubview:_but1];
    
    UIImageView *imageSmall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"飞机.jpg"]];
    imageSmall.frame = CGRectMake(0, 0, 100, 100);
    imageSmall.alpha = 1;
    [_but1 addSubview:imageSmall];
    
    [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(start) userInfo:nil repeats:YES];
    

}

- (void)start{

    static int x = 5;
    static int y = 5;
    
    [UIView animateWithDuration:0.1 animations:^{
        CGPoint center = _but1.center;
        center.x += x;
        center.y += y;
        
        _but1.center = center;
    }];
    
    if ((_but1.center.x + 50) >= (self.view.frame.size.width) || (_but1.center.x <= 50)) {
        x = -x;
    }
    if ((_but1.center.y + 50) >= (self.view.frame.size.height) || (_but1.center.y <= 50)) {
        y = -y;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
