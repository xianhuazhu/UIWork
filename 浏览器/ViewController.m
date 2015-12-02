//
//  ViewController.m
//  浏览器修改一
//
//  Created by qingyun on 15/11/18.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSUInteger index;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (nonatomic,strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //子视图可以交互
    _imageView.userInteractionEnabled = YES;
    //初始化界面
    [self upDataData];

}

//懒加载
- (NSArray *)images
{
    if (_images == nil) {
        NSString *imageViewPath = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
        //拿imageViewPath初始化_imageView
        _images = [NSArray arrayWithContentsOfFile:imageViewPath];
    }
    return _images;
}

- (IBAction)clickButton:(UIButton *)sender {
    
    switch (sender.tag) {
        case 10001:
            index--;
            [self upDataData];
            break;
        case 10002:
            index++;
            [self upDataData];
            break;
        default:
            break;
    }
}


- (void)upDataData
{
    //1/更新indexlabel的文本
    NSString *indexLabelText = [NSString stringWithFormat:@"%ld/%ld",index+1,self.images.count];
    _indexLabel.text = indexLabelText;
    
    //2.更改imageView的图片
    NSDictionary *dict = self.images[index];
    NSString *imageName = [dict objectForKey:@"name"];
    UIImage *image = [UIImage imageNamed:imageName];
    _imageView.image = image;
    
    //更改当前图片的描述
    NSString *descLabelText = dict[@"desc"];
    _descLabel.text = descLabelText;
    
    //更改左右btn的状态
    _leftButton.enabled = index == 0 ? NO : YES;
    _rightButton.enabled = index == self.images.count - 1 ? NO : YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
