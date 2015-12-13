//
//  ViewController.m
//  01-GestureSimpleDemo
//
//  Created by qingyun on 15/12/12.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//点击手势 (UITapGestureRecognizer)
//滑动手势 (UISwipeGestureRecognizer)
//旋转手势 (UIRotationGestureRecognizer)
//捏合手势 (UIPinchGestureRecognizer)
//长按手势 (UILongPressGestureRecognizer)
//平移手势 (UIPanGestureRecognizer)
//屏幕边缘平移手势 (UIScreenEdgePanGestureRecognizer)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if 0
    //单击手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    //点击次数
    singleTap.numberOfTapsRequired= 1;
    //手指个数
    singleTap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:singleTap];
    
    //双击手势
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    //建立单击手势和双击手势之间的依赖关系
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    //滑动手势(左)
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    
    [self.view addGestureRecognizer:rotation];
    
    //捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.view addGestureRecognizer:pinch];
    
    //长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.allowableMovement = 0.1;
    [self.view addGestureRecognizer:longPress];
    
    //平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    //[self.view addGestureRecognizer:pan];
    //屏幕边缘平移手势
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanAction:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];
#endif
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)singleTap:(UITapGestureRecognizer *)gesture{
    NSLog(@"单击");
}

-(IBAction)doubleTap:(UITapGestureRecognizer *)gesture{
    NSLog(@"双击");
}

-(IBAction)swipeAction:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"滑动direction:%ld state:%ld",gesture.direction, gesture.state);
}

-(IBAction)rotationAction:(UIRotationGestureRecognizer *)gesture{
    NSLog(@"旋转 rotation:%f velocity:%f state:%ld",gesture.rotation,gesture.velocity,gesture.state);
}

-(IBAction)pinchAction:(UIPinchGestureRecognizer *)gesture{
    NSLog(@"捏合 scale:%f velocity:%f state:%ld",gesture.scale,gesture.velocity,gesture.state);
}

-(IBAction)longPressAction:(UILongPressGestureRecognizer *)gesture{
    NSLog(@"长按 %ld",gesture.state);
}

-(IBAction)panAction:(UIPanGestureRecognizer *)gesture{
    NSLog(@"平移 %@",NSStringFromCGPoint([gesture translationInView:self.view]));
}

-(IBAction)edgePanAction:(UIScreenEdgePanGestureRecognizer *)gesture{
    NSLog(@"屏幕边缘平移手势");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
