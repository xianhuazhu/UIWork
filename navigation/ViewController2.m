//
//  ViewController2.m
//  3-Navigation
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];//设置颜色后两翻页不卡了
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    

    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 80, 40);
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonIterm = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarButtonIterm;
}

- (void)back:(UIButton *)btn
{
#if 0
    //当前导航视图控制器中的全部视图控制器,根试图控制器的索引是0
    //pop到指定的导航控制器
    UIViewController *vc = self.navigationController.viewControllers[0];
    [self.navigationController popToViewController:vc animated:YES];
#else
    //pop到根试图控制器
    [self.navigationController popToRootViewControllerAnimated:YES];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
