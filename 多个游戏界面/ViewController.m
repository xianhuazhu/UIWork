//
//  ViewController.m
//  多个游戏界面完整
//
//  Created by qingyun on 15/11/17.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define distance 10

@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;

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
  /*
    CGFloat imageViewX = 0;
    CGFloat imageViewY = 10;
    CGFloat imageViewW = (ScreenW - 5*distance)/4;
    CGFloat imageViewH = 90;
    for (NSUInteger j = 0; j < 5; j++) {
        for (NSUInteger i = 0; i < 4; i++) {
            //1.创建界面
            imageViewX += distance;
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
            [self.view addSubview:imageView];
            imageView.backgroundColor = [UIColor grayColor];
            imageViewX += imageViewW;
        }
        imageViewX = 0;
        imageViewY += distance;
        imageViewY += imageViewH;
    }
   */
    
    //总列数
    int totalColumn = 4;
    //appView的宽度和高度
    CGFloat appW = 80;
    CGFloat appH = 90;
    //appView的水平方向和垂直方向的间隔
    CGFloat marginX = (ScreenW - totalColumn*appW)/(totalColumn + 1);
    CGFloat marginY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        //1. 创建appView的背景视图，并添加到self.view上
        int row = i / totalColumn;
        int column = i % totalColumn;
        CGFloat appX = marginX + column*(marginX + appW);
        CGFloat appY = marginY + row *(marginY + appH);
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(appX, appY, appW, appH)];
        [self.view addSubview:appView];
        //appView.backgroundColor = [UIColor grayColor];
        
        //2.创建icon视图，并添加到appView上
        CGFloat iconX = 20;
        CGFloat iconY = 0;
        CGFloat iconW = appW - 2*iconX;
        CGFloat iconH = 40;
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        [appView addSubview:icon];
        NSDictionary *appDate = self.apps[i];
        icon.image = [UIImage imageNamed:appDate[@"icon"]];
        
        //3. 创建Label
        CGFloat labelX = 0;
        CGFloat labelY = iconH;
        CGFloat labelW = appW;
        CGFloat labelH = 20;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        [appView addSubview:label];
        label.text = appDate[@"name"];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        
        //4. 创建 Button
        CGFloat downloadBtnX = 10;
        CGFloat downloadBtnY = iconH + labelH;
        CGFloat downloadBtnW = appW - 2*downloadBtnX;
        CGFloat downloadBtnH = 20;
        
        UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        downloadBtn.frame = CGRectMake(downloadBtnX, downloadBtnY, downloadBtnW, downloadBtnH);
        [appView addSubview:downloadBtn];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateNormal];
        [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [downloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        downloadBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
