//
//  ViewController.m
//  多个游戏界面Xib
//
//  Created by qingyun on 15/11/17.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic,strong) NSArray *apps;

@end

@implementation ViewController

- (NSArray *)apps
{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //列总数
    int totalColumn = 4;
    
    //appView的水平方向和垂直方向的间隔
    CGFloat appW = 80;
    CGFloat appH = 90;
    //的水平方向和垂直方向的间隔
    CGFloat marginX = (kScreenW - totalColumn*appW) / (totalColumn+1);
    CGFloat marginY = 30;
    
    for (int i = 0 ; i < self.apps.count; i++) {
        //1. 从xib加载appView视图
        UIView *appView = [[NSBundle mainBundle] loadNibNamed:@"imageView" owner:nil options:nil][0];
        [self.view addSubview:appView];
        
        
        int row = i / totalColumn;
        int column = i % totalColumn;
        CGFloat appX = marginX + column * (marginX + appW);
        CGFloat appY = marginY + row * (marginY + appH);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        //2. 设置appView视图的数据 M
        //设置icon图片
        UIImageView *icon = (UIImageView *)[appView viewWithTag:100];
        NSDictionary *appData = self.apps[i];
        icon.image = [UIImage imageNamed:appData[@"icon"]];
        //设置title的文字
        UILabel *title = (UILabel *)[appView viewWithTag:1001];
        title.text = appData[@"name"];
        title.font = [UIFont systemFontOfSize:12];
    }
    //appView
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
