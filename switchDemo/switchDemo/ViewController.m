//
//  ViewController.m
//  switchDemo
//
//  Created by qingyun on 15/12/2.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatAndSwitch];
    [self creatAndAddProgressView];
    [self creatAndStepper];
    [self creatSlider];
    [self creatAndAddSegmentControl];
}

#pragma -mark UISwitch
- (void)creatAndSwitch
{
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    [self.view addSubview:sw];
    
    //开启状态着色
    sw.onTintColor = [UIColor greenColor];
    //关闭状态着色
    sw.tintColor = [UIColor whiteColor];
    //拇指着色
    sw.thumbTintColor = [UIColor grayColor];
    //添加事件监听
    [sw addTarget:self action:@selector(changState:) forControlEvents:UIControlEventValueChanged];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeSwitchOnState:) userInfo:sw repeats:YES];
}

- (void)changeSwitchOnState:(NSTimer *)timer
{
    UISwitch *sw = timer.userInfo;
    [sw setOn:!sw.on animated:YES];
}

- (void)changState:(UISwitch *)sw
{
    NSLog(@"%d",sw.on);
}
#pragma mark -ProgressView
- (void)creatAndAddProgressView
{
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    [self.view addSubview:progressView];
    progressView.frame = CGRectMake(100, 150, 200, 200);
    progressView.backgroundColor = [UIColor redColor];
    
    //设置当前值
    progressView.progress = 0.0;
    //设置走过轨迹的颜色
    progressView.progressTintColor = [UIColor greenColor];
    //未走过轨迹的颜色
    progressView.trackTintColor = [UIColor yellowColor];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeProgress:) userInfo:progressView repeats:YES];
}

- (void)changeProgress:(NSTimer *)timer
{
    UIProgressView *progressView = timer.userInfo;
    if (progressView.progress == 1) {
        progressView.progress = 0;
    }
    
    [progressView setProgress:(progressView.progress + 0.1) animated:YES];
}

#pragma mark -UIStepper
- (void)creatAndStepper
{
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 280, 200, 100)];
    [self.view addSubview:stepper];
    
    //设置stepper的大小范围
    stepper.maximumValue = 100;
    stepper.minimumValue = 0;
    
    //设置stepper当前值
    stepper.value = 50;
    //试着stepper的步长
    stepper.stepValue = 5;
    
    //设置tint的颜色
    //stepper.tintColor = [UIColor redColor];
    
    //添加事件监听
    [stepper addTarget:self action:@selector(stepperValueChange:) forControlEvents:UIControlEventValueChanged];
    //设置stepper值，yes长按键值连续变化，no长按键值不连续变化
    stepper.continuous = YES;
    //设置stepper长按是否一直触发事件，如果为yes一直触发事件，no点击结束之后触发事件
    stepper.autorepeat = NO;
    //是否循环改变值
    stepper.wraps = YES;
    
    //[stepper setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted.png"] forState:UIControlStateNormal];
    UIImage *incrementImage = [[UIImage imageNamed:@"Icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [stepper setIncrementImage:incrementImage forState:UIControlStateNormal];
    [stepper setDecrementImage:incrementImage forState:UIControlStateNormal];
    [stepper setDecrementImage:incrementImage forState:UIControlStateHighlighted];
}

- (void)stepperValueChange:(UIStepper *)stepper
{
    NSLog(@"%f",stepper.value);
}

#pragma mark -Slider
- (void)creatSlider
{
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [self.view addSubview:slider];
    
    //设置slider的大小范围
    slider.maximumValue = 100;
    slider.minimumValue = 10;
    
    //当前value
    slider.value = 20;
    
    //设置slider左右两边图片
    slider.maximumValueImage = [UIImage imageNamed:@"coin.png"];
    slider.minimumValueImage = [UIImage imageNamed:@"coin.png"];
    
    //设置拇指两边的颜色和拇指的颜色
    slider.maximumTrackTintColor = [UIColor redColor];
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.thumbTintColor = [UIColor grayColor];
    
    //设置拇指两边的图片及拇指的图片
    [slider setMinimumTrackImage:[UIImage imageNamed:@"line.png"] forState:UIControlStateNormal];
    [slider setThumbImage:[UIImage imageNamed:@"coin"] forState:UIControlStateNormal];
    
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
    NSArray *items = @[@"first", @"second", @"third"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [self.view addSubview:segmentControl];
    
    segmentControl.frame = CGRectMake(60, 390, 260, 30);
    
    //不保留选中状态
    segmentControl.momentary = YES;
    //根据内容来适配每段的宽度
    segmentControl.apportionsSegmentWidthsByContent = YES;
    //动态添加一段
    [segmentControl insertSegmentWithTitle:@"fourth" atIndex:3 animated:YES];
    
    //动态删除一段
    [segmentControl removeSegmentAtIndex:3 animated:YES];
    
    //更改具体某段的标题
    [segmentControl setTitle:@"第一段" forSegmentAtIndex:0];
    
    //获取某段标题
    NSString *string = [segmentControl titleForSegmentAtIndex:1];
    NSLog( @"%@",string);
    //获取某一段的内容偏移量
    [segmentControl setContentOffset:CGSizeMake(-10, 0) forSegmentAtIndex:0];
    
    //添加时间监听
    [segmentControl addTarget:self action:@selector(segmentControlValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentControlValueChange:(UISegmentedControl *)segmentControl
{
    NSLog(@"%@",[segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
@end
