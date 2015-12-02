//
//  ViewControllerTextFieldViewController.m
//  switchDemo
//
//  Created by qingyun on 15/12/2.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()<UITextFieldDelegate>

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    [self.view addSubview:userName];
    //userName.backgroundColor = [UIColor redColor];
    userName.placeholder = @"请输入用户名";
    //字体大小
    userName.font = [UIFont systemFontOfSize:20];
    //对齐方式
    userName.borderStyle = UITextBorderStyleRoundedRect;
    //当开始编辑的时候清除内容
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //根据宽度适应字体大小
    userName.adjustsFontSizeToFitWidth = YES;
    //字体最小size
    userName.minimumFontSize = 0;
    
    //设置背景
    userName.background = [[UIImage imageNamed:@"point.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(7, 8, 8, 8) resizingMode:UIImageResizingModeStretch];
    
    //设置左边视图
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"username"]];
    leftView.frame = CGRectMake(0, 0, 17, 17);
    
    //设置左视图显示模式
    userName.leftViewMode = UITextFieldViewModeAlways;
    userName.leftView = leftView;
    
    //键盘类型
    userName.keyboardType = UIKeyboardTypeNamePhonePad;
    userName.keyboardAppearance = UIKeyboardAppearanceLight;
    
    //返回类型
    userName.returnKeyType = UIReturnKeyGoogle;
    //自动判断returnkey的可用状态
    userName.enablesReturnKeyAutomatically = YES;
    userName.autocorrectionType = UITextAutocorrectionTypeNo;
    
    UITextField *passWord = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 150, 30)];
    [self.view addSubview:passWord];
    
    passWord.placeholder = @"请输入密码";
    //边框
    passWord.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置左视图
    UIImageView *psLeftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    psLeftView.frame = CGRectMake(0, 0, 17, 17);
    passWord.leftViewMode = UITextFieldViewModeAlways;
    passWord.leftView = psLeftView;
    
    //密文
    passWord.secureTextEntry = YES;
    
    userName.delegate = self;
    passWord.delegate = self;
}

/*- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
 {
 [self.view endEditing:YES];
 }
 */

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%s",__func__);
    NSLog(@"range:%@",NSStringFromRange(range));
    NSLog(@"string:%@",string);
    if (range.location > 10) {
        [self showAlertView:@"输入长度不能大于11"];
        return NO;
    }
    
    //判断输入是否合法
    //创建一个数字和字母的集合
    NSCharacterSet *characterSet = [NSCharacterSet alphanumericCharacterSet];
    for (int i = 0; i < string.length; i++) {
        unichar c = [string characterAtIndex:i];
        //用c判断是否在characterSet中
        if (![characterSet characterIsMember:c]) {
            [self showAlertView:@"输入字符不合法，请输入数字或字母！"];
            return NO;
        }
    }
    return YES;
}

- (void)showAlertView:(NSString *)massage
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:massage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
