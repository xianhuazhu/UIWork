//
//  ViewController.m
//  UISwitch
//
//  Created by qingyun on 15/11/21.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  creatAndSwitch];
    [self creatAndAddProgressView];
    [self creatAndAddStepper];
    [self creatAndAddSlider];
    [self creatAndAddSegmentControl];
}

#pragma mark -UISwitch
- (void)creatAndSwitch
{
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100,50, 0, 0)];
    [self.view addSubview:sw];
    
    //开启状态 着色
    sw.onTintColor = [UIColor greenColor];
    //关闭状态 着色
    sw.tintColor = [UIColor whiteColor];
    //拇指着色
    sw.thumbTintColor = [UIColor brownColor];
    //开启状态图片 （ios6有效，ios7之后无效）
    sw.onImage = [UIImage imageNamed:@"1.png"];

    //添加事件监听
    [sw addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventValueChanged];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeSwitchOnState:) userInfo:sw repeats:YES];
    
}

- (void)changeSwitchOnState:(NSTimer *)timer
{
    UISwitch *sw = timer.userInfo;
    [sw setOn:!sw.on animated:YES];
}

- (void)changeState:(UISwitch *)sw
{
    NSLog(@"%d",sw.on);
}

#pragma mark -UIProgressView
- (void)creatAndAddProgressView
{
    UIProgressView *progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    [self.view addSubview:progressView];
    progressView.frame=CGRectMake(100, 150, 200, 200);
    progressView.backgroundColor=[UIColor greenColor];
    //设置当前进度条的位置值
    progressView.progress = 0.2;
    //已经走过的轨迹的颜色
    progressView.progressTintColor = [UIColor whiteColor];
    //已经走过的轨迹的图片（该方法已无效）
    progressView.progressImage = [UIImage imageNamed:@"1.png"];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeProgress:) userInfo:progressView repeats:YES];
    
    
}

- (void)changeProgress:(NSTimer *)timer
{
    UIProgressView *progressView =timer.userInfo;
    if (progressView.progress ==1) {
        progressView.progress=0;
    }
    [progressView setProgress:(progressView.progress + 0.1) animated:YES];
}

#pragma mark -UIStepper
- (void)creatAndAddStepper
{
    UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    [self.view addSubview:stepper];
    
    //设置stepper的最大、最小范围
    stepper.maximumValue=100;
    stepper.minimumValue=0;
    
    //设置stepper当前值
    stepper.value= 50;
    //设置stepper的步长
    stepper.stepValue =5;
    
    //添加事件监听
    [stepper addTarget:self action:@selector(stepperValueChange:) forControlEvents:UIControlEventValueChanged];
    //设置stepper值连续变化，yes长按连续触发值改变， no值的改变不连续
    stepper.continuous =NO;
    //设置stepper长按是否一直触发事件，如果为yes一直触发事件， no点击结束之后触发
    stepper.autorepeat=NO;
    
    
    //是否循环改变值
    stepper.wraps=YES;
    
    //设置tintColor
    //stepper.tintColor=[UIColor greenColor];
    
    //设置背景图片
    [stepper setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted.png"] forState:UIControlStateNormal];
    //获取背景图片
    UIImage *image = [stepper backgroundImageForState:UIControlStateNormal];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 40, 40)];
    [self.view addSubview:imageview];
    imageview.image=image;
   
    
    //设置分割线
    [stepper setDividerImage:[UIImage imageNamed:@"2.png"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    //设置左右两边的图片
    UIImage *lrimage = [[UIImage imageNamed:@"coin.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [stepper setIncrementImage:lrimage forState:UIControlStateNormal];
    [stepper setDecrementImage:lrimage forState:UIControlStateHighlighted];
    
}

- (void)stepperValueChange:(UIStepper *)stepper
{
    NSLog(@"%f",stepper.value);
}

#pragma mark -UISlider
- (void)creatAndAddSlider
{
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    [self.view addSubview:slider];
    
    //设置slider的最大，小范围
    slider.maximumValue = 20;
    slider.minimumValue = 0;
    
    //当前value
    slider.value = 5;
    
    //设置左右两边的图片
    slider.minimumValueImage = [UIImage imageNamed:@"coin.png"];
    slider.maximumValueImage = [UIImage imageNamed:@"coin.png"];
    
    //设置拇指两边的颜色以及拇指的颜色
    slider.minimumTrackTintColor = [UIColor blackColor];
    slider.maximumTrackTintColor = [UIColor greenColor];
    slider.thumbTintColor = [UIColor grayColor];
    
    //设置拇指两边的图片以及拇指的图片
    [slider setMinimumTrackImage:[UIImage imageNamed:@"line.png"] forState:UIControlStateNormal];
    [slider setThumbImage:[UIImage imageNamed:@"coin.png"] forState:UIControlStateNormal];
    
  //添加监听事件
    [slider addTarget:self action:@selector(changeSliderValue:) forControlEvents:UIControlEventValueChanged];
    //设置slider的value是否连续变化
    slider.continuous = NO;
    
}
- (void)changeSliderValue:(UISlider *)slider
{
    NSLog(@"%f",slider.value);
}

#pragma mark -UISegmentControl
- (void)creatAndAddSegmentControl
{
    NSArray *items = @[@"first",@"second",@"third"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [self.view addSubview:segmentControl];
    segmentControl.frame = CGRectMake(60, 390, 260, 30);
    
    //保留选中状态(NO)(不保留是YES)
    segmentControl.momentary = NO;
    //根据内容来适配每段的宽度
    segmentControl.apportionsSegmentWidthsByContent = YES;
    //动态添加一段
    [segmentControl insertSegmentWithTitle:@"fourth" atIndex:3 animated:YES];
    //动态删除一段
    [segmentControl removeSegmentAtIndex:0 animated:YES];
    
    //更改具体某段的标题
    [segmentControl setTitle:@"未接来电" forSegmentAtIndex:0];
    //获取某段标题
    NSString *string = [segmentControl titleForSegmentAtIndex:2];
    NSLog(@"string :%@",string);
    //设置第一段的内容偏移量
    [segmentControl setContentOffset:CGSizeMake(-20, 0) forSegmentAtIndex:1];
    
    //添加事件监听
    [segmentControl addTarget:self action:@selector(segmentControlValueChange:) forControlEvents:UIControlEventValueChanged];
}
- (void)segmentControlValueChange:(UISegmentedControl *)segmentControl
{
    NSLog(@"%@",[segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex]);
}

@end
