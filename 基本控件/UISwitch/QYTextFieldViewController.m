//
//  QYTextFieldViewController.m
//  UISwitch
//
//  Created by qingyun on 15/11/21.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYTextFieldViewController.h"

@interface QYTextFieldViewController ()<UITextFieldDelegate>

@end

@implementation QYTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *userName = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, 150, 30)];
    [self.view addSubview:userName];
    userName.backgroundColor= [UIColor lightGrayColor];
    
    userName.placeholder = @"请输入用户名";
    //字体大小
    userName.font = [UIFont systemFontOfSize:20];
    //对齐方式
   // userName.textAlignment =NSTextAlignmentCenter;
    //设置边框(圆角)
    userName.borderStyle = UITextBorderStyleRoundedRect;
    //当开始编辑的时候清除内容
    //userName.clearsOnBeginEditing = YES;
    //一键清除文本显示的mode(显示叉号)
    userName.clearButtonMode = UITextFieldViewModeUnlessEditing;
    
    //根据宽度适应字体大小
    userName.adjustsFontSizeToFitWidth = YES;
    //字体最小size
    userName.minimumFontSize =0;
    
    //设置背景
    userName.background = [[UIImage imageNamed:@"point.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(9,13, 9,13) resizingMode:UIImageResizingModeStretch];
    //设置左视图
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"username.png"]];
    leftView.frame=CGRectMake(0, 0, 17, 25);
    //设置左视图显示模式
    userName.leftViewMode = UITextFieldViewModeAlways;
    userName.leftView = leftView;

#if 0
    //自定义键盘
    //输入区
    userName.inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 260)];
    userName.inputView.backgroundColor = [UIColor grayColor];
    //键盘区
    userName.inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    userName.inputAccessoryView.backgroundColor = [UIColor brownColor];
#endif
    //键盘类型
    userName.keyboardType = UIKeyboardTypeNamePhonePad;
    //显示
    userName.keyboardAppearance = UIKeyboardAppearanceLight;
    
    //返回类型
    userName.returnKeyType = UIReturnKeyGoogle;
    
    //自动判断returnKey的可用状态
    userName.enablesReturnKeyAutomatically = YES;
    
    userName.autocorrectionType = UITextAutocapitalizationTypeNone;
    
    
    UITextField *password = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 150, 30)];
    [self.view addSubview:password];
    password.backgroundColor = [UIColor lightGrayColor];
    password.placeholder = @"请输入密码";
    //边框
    password.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置左视图
    UIImageView *passworldView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    passworldView.frame = CGRectMake(0, 0, 17, 25);
    password.leftViewMode = UITextFieldViewModeAlways;
    password.leftView = passworldView;
    //密文
    password.secureTextEntry = YES;
    
    userName.delegate = self;
    password.delegate = self;
    
    
}

//取消(第一响应)编辑
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//允许开始编辑
- (BOOL)textFielDidBeginEditing:(UITextField *)textField
{
    return YES;
}
//已经开始编辑
- (void)textfieldShoudEndEditing:(UITextField *)textField
{
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}
//允不允许清除
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
//允不允许返回（点击 return 键时才触发）
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //取消第一响应
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //替换字符
    NSLog(@"%s",__func__);
    NSLog(@"range:%@",NSStringFromRange(range));
    NSLog(@"string:%@",string);
    
    
    //输入长度不能大于11
    if (range.location >10) {
        [self showAlertView:@"输入长度不能大于11"];
        return NO;
    }
    
    //判断是否合法
    //创建一个数字与字母的集合
    NSCharacterSet *characterSet = [NSCharacterSet alphanumericCharacterSet];
    
    for (int i=0; i< string.length; i++) {
        unichar c = [string characterAtIndex:i];
        //拿c判断是否在characherIsMember
        if (![characterSet characterIsMember:c]) {
            [self showAlertView:@"输入字符不合法，请输入字母和数字!"];
            return NO;
        }
    }
    return YES;
    
}

- (void)showAlertView:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}



@end
