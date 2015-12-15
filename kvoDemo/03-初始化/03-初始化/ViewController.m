//
//  ViewController.m
//  03-初始化
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYViewController.h"
#import "QYViewControllerWithStoryBoard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)goToQYVC:(UIButton *)sender {
    QYViewController *qyVC = [[QYViewController alloc] init];
    [self presentViewController:qyVC animated:YES completion:nil];
}
- (IBAction)goToStroryBoardVC:(UIButton *)sender {
    
//    QYViewControllerWithStoryBoard *sbVC = [[QYViewControllerWithStoryBoard alloc] init];
//    [self presentViewController:sbVC animated:YES completion:nil];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QYViewControllerWithStoryBoard *sbVC = [storyBoard instantiateViewControllerWithIdentifier:@"sbvc"];
    [self presentViewController:sbVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
