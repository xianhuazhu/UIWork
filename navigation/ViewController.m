//
//  ViewController.m
//  3-Navigation
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    //更改导航栏的透明
    //self.navigationController.navigationBar.translucent = NO;
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(100, 80, 100, 40);
    [nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:nextButton];
    [nextButton addTarget:self action:@selector(gotoVC2:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavigationBar];
    [self setToolbar];
}

- (void)gotoVC2:(UIButton *)nextButton
{
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}

- (void)setNavigationBar
{
   // self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //设置左边的barButtonIterm
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick:)];
    
    //self.navigationItem.leftBarButtonItems可以设置数组
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    //设置titleView(中间的)
    NSArray *iterms = @[@"所有通话",@"未接通话"];
    UISegmentedControl *segmentControll = [[UISegmentedControl alloc] initWithItems:iterms];
    
    self.navigationItem.titleView = segmentControll;
    
    //设置右边的
//    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"照相" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick:)];
    
    //对图片进行渲染，是图片保持原有的状态，不受影响
    UIImage *image = [[UIImage imageNamed:@"navigationbar_compose_os7@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//方法一
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithImage:image  style:UIBarButtonItemStylePlain target:self action:nil];
    
    //rightBarButton.tintColor = [UIColor blackColor];//方法2
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    //自定义导航栏背景
    UIImage *bgImage = [UIImage imageNamed:@"bgimgae"];
    [self.navigationController.navigationBar setBackgroundImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 4, 6, 3) resizingMode:UIImageResizingModeTile] forBarMetrics:UIBarMetricsDefault];
}

- (void)setToolbar
{
    //显示工具栏
    self.navigationController.toolbarHidden = NO;
    //创建工具栏内容
    UIBarButtonItem *first = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    UIBarButtonItem *second = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_pop_os7"] style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *thirdBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"转发" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //创建固定间隔的barButtonIterm
    UIBarButtonItem *FlexibleSpaceBarBtnIterm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    FlexibleSpaceBarBtnIterm.width = 50;
    //创建固定间隔的barButtonIterm
//    UIBarButtonItem *fixedSpaceBtnButIterm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    NSArray *iterm = @[FlexibleSpaceBarBtnIterm,first ,FlexibleSpaceBarBtnIterm,second , FlexibleSpaceBarBtnIterm,thirdBarBtnItem,FlexibleSpaceBarBtnIterm];
    [self setToolbarItems:iterm animated:YES];
}

- (void)leftBarButtonClick:(UIBarButtonItem *)barIterm
{
    NSLog(@"菜单");
}

- (void)rightBarButtonClick:(UIBarButtonItem *)barIterm
{
    NSLog( @"照相");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
