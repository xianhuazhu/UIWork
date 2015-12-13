//
//  ViewController.m
//  02-GestureReongnizerDemo
//
//  Created by qingyun on 15/12/12.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *magenta;
@property (weak, nonatomic) IBOutlet UIImageView *cyan;
@property (weak, nonatomic) IBOutlet UIImageView *yellow;

@property (nonatomic, strong) UIView *resetView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//旋转
- (IBAction)rotationAction:(UIRotationGestureRecognizer *)sender {
    NSLog(@"%f",sender.rotation);
    //手势作用的视图
    UIView *view = sender.view;
    //旋转的角度（弧度）
    CGFloat rotation = sender.rotation;
    //设置transform（旋转）
    view.transform = CGAffineTransformRotate(view.transform, rotation);
    sender.rotation = 0;
}
//缩放（捏合）
- (IBAction)pinchAction:(UIPinchGestureRecognizer *)sender {
    
    //手势作用的视图
    UIView *view = sender.view;
    //缩放的比例
    CGFloat scale = sender.scale;
    //设置transform （缩放）
    view.transform = CGAffineTransformScale(view.transform, scale, scale);
    sender.scale = 1;
}

//移动
- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    
    //手势作用的视图
    UIView *view = sender.view;
    //手势移动量
    CGPoint translation = [sender translationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(translation));
    view.center = CGPointMake(view.center.x + translation.x, view.center.y+ translation.y);
    
    [sender setTranslation:CGPointZero inView:self.view];
    
}

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        //创建UIMenuItem对象
        UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"reset" action:@selector(resetTargetView)];
        
        //创建UIMenuController对象
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        menuController.menuItems = @[item];
        
        //item放的位置
        CGPoint location = [sender locationInView:sender.view];
        [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:sender.view];
        
        [sender.view becomeFirstResponder];
        
        //设置菜单显示
        [menuController setMenuVisible:YES animated:YES];
        
        _resetView = sender.view;
    }
}

-(void)resetTargetView{
    
    [UIView animateWithDuration:0.3 animations:^{
      _resetView.transform = CGAffineTransformIdentity;
    }];
}

//允许两个手势同时触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
