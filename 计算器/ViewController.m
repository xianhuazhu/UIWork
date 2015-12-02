//
//  ViewController.m
//  01-计算器
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *leftTextField;
@property (weak, nonatomic) IBOutlet UITextField *rightTextField;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(UIButton *)sender {
    //取出两个输入框的文本
    int leftNum = [_leftTextField.text intValue];
    int rightNum = [_rightTextField.text intValue];
    int result = leftNum + rightNum;
    
    //@(result)
    //[NSNumber numberWithInt:result];
    _result.text = [@(result) stringValue];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
#if 0
    //取消两个输入框的编辑 第一响应
    [_leftTextField resignFirstResponder];
    [_rightTextField resignFirstResponder];
#else
    //父视图结束编辑，子视图失去第一响应
    [self.view endEditing:YES];
#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
