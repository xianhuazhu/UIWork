//
//  ViewController.m
//  03-触摸练习
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *magentaView;
@property (weak, nonatomic) IBOutlet UIImageView *cyanView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",touches);
    
    //判断当前点击的点是否需要处理（在imageView内）
    
    //取出点击的point（注意坐标系：self.view）
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    //如果需要处理，把对应的imageView放大1.2，更改imageView的center为点击的point
    if (CGRectContainsPoint(_magentaView.frame, location)
        ||CGRectContainsPoint(_cyanView.frame, location)
        ||CGRectContainsPoint(_yellowView.frame, location)) {
        //取出触摸发生的视图
        [UIView animateWithDuration:0.5 animations:^{
            UIImageView *imageView = (UIImageView *)touch.view;
            //imageView.center = location;
            imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }else{
        if (touch.tapCount == 2) {
            [self resetFrames];
        }
    }
}

//重置frame
-(void)resetFrames{
    [UIView animateWithDuration:0.5 animations:^{
        _magentaView.frame = CGRectMake(20, 28, 100, 100);
        _cyanView.frame = CGRectMake(137, 284, 100, 100);
        _yellowView.frame = CGRectMake(255, 547, 100, 100);
    }];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //移动时的触摸点在哪个imageView的frame内，就把它的center设置成触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(_magentaView.frame, point)) {
        [UIView animateWithDuration:0.3 animations:^{
            _magentaView.center = point;
        }];
    }
    
    if (CGRectContainsPoint(_cyanView.frame, point)) {
        [UIView animateWithDuration:0.3 animations:^{
            _cyanView.center = point;
        }];
    }
    
    if (CGRectContainsPoint(_yellowView.frame, point)) {
        [UIView animateWithDuration:0.3 animations:^{
            _yellowView.center = point;
        }];
    }
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   //还原触摸视图的大小
    //取触摸
    UITouch *touch = [touches anyObject];
    
    //取触摸视图
    UIImageView *imageView = (UIImageView *)touch.view;
    
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
