//
//  ViewController.m
//  05-UITextView
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.backgroundColor = [UIColor lightGrayColor];
    
    [self configTextView];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

//键盘处理
-(void)keyBoardHandle:(NSNotification *)notification{
    //开始rect
    CGRect beginRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    //结束rect
    CGRect endRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat detalY = endRect.origin.y - beginRect.origin.y;
    
    CGRect textViewFrame = _textView.frame;
    textViewFrame.size.height += detalY;
    
    //键盘动画事件间隔
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        _textView.frame = textViewFrame;
    }];
    
}


-(void)configTextView
{
    //黑体
    NSRange boldRange = [_textView.text rangeOfString:@"enim"];
    
    //背景颜色
    NSRange bgRange = [_textView.text rangeOfString:@"exercitation"];
    
    //下划线
    NSRange underLineRange = [_textView.text rangeOfString:@"commodo"];
    
    //字体颜色
    NSRange tintedRange = [_textView.text rangeOfString:@"Excepteur"];
    
    //创建一个属性文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:_textView.attributedText];
    
    //添加属性
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:boldRange];
    
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:bgRange];
    
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:underLineRange];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:tintedRange];
    
    //添加图片
    NSTextAttachment *attachMent = [[NSTextAttachment alloc] init];
    attachMent.image = [UIImage imageNamed:@"text_view_attachment.png"];
    
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attachMent];
    
    [attributedString appendAttributedString:attachString];
    
    _textView.attributedText = attributedString;
}

#pragma mark -UITextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarBtnItemClick:)];
    self.navigationItem.rightBarButtonItem = barBtnItem;
}

-(void)rightBarBtnItemClick:(UIBarButtonItem *)item{
    //取消textView的第一响应
    [_textView resignFirstResponder];
    
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

@end
