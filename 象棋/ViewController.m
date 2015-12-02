//
//  ViewController.m
//  象棋
//
//  Created by qingyun on 15/11/10.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *view0;
@property (nonatomic, strong) UIView *viewSub;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   //1. 创建一个新的view
//    _view0 = [[UIView alloc] initWithFrame:CGRectMake(10, 20, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 80)];
//    _view0.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_view0];
//    
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"盘底.jpg"]];
    image2.frame = CGRectMake(15, 150, CGRectGetWidth(self.view.frame) - 30, CGRectGetHeight(self.view.frame) - 300);
    [self.view addSubview:image2];
    
    image2.contentMode = UIViewContentModeCenter;
    image2.clipsToBounds = YES;
    
    
    //2. 添加一张图片
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"棋盘.jpg"]];
    image.frame = CGRectMake(30, 50, CGRectGetWidth(self.view.frame) - 95, CGRectGetWidth(self.view.frame) - 100);
    [image2 addSubview:image];
    
    image.contentMode = UIViewContentModeCenter;
    image.clipsToBounds = YES;
    
    //3. 设置棋盘格式

    NSUInteger a = 0;
    NSUInteger b = 0;
    for (NSUInteger k = 0; k < 4; k++) {
        for (NSUInteger j = 1; j < 3; j++) {
            for (NSUInteger i = 0; i < 4; i ++) {
                
                UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"格子.jpg"]];
                image1.frame = CGRectMake(a, b, CGRectGetWidth(self.view.frame) - 340, CGRectGetWidth(self.view.frame) - 340 );
                
                [image addSubview:image1];
                
                image1.contentMode = UIViewContentModeCenter;
                image1.clipsToBounds = YES;
                a += 70;
            }
            a = 35;
            b += 35;
        }
        a = 0;
    }


       // [image addSubview:_viewSub];


    
    
//    //创建一个新的bigButton
//    UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [bigButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [bigButton setTitle:@"bigButton" forState:UIControlStateNormal];
//    bigButton.frame = CGRectMake(100, CGRectGetHeight(self.view.frame) - 80, 80, 40);
//    [self.view addSubview:bigButton];
//    
//    [bigButton addTarget:self action:@selector(toBigButton:) forControlEvents:UIControlEventTouchUpInside];
//
//}
//
//- (void)toBigButton:(UIButton *)sender{
//    
//    image2.frame = CGRectMake(10, 50, self.view.frame.size.width - 20, CGRectGetHeight(self.view.frame) - 100);
//    
    //viewwithtag可以通过tag来获取一个指定的子视图
    NSLog(@"view >>> %@",[_view0 viewWithTag:1]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
