//
//  FifthViewController.m
//  01-选择器
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "FifthViewController.h"

#import <AVFoundation/AVFoundation.h>

#import <AudioToolbox/AudioToolbox.h>

@interface FifthViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;

@property (nonatomic) NSInteger hardLevel;//困难级别

@property (nonatomic, strong) NSArray *images;//图片

@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置数据源和代理
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    _segmentControl.selectedSegmentIndex = 1;
    _hardLevel = 3;
    
    _images = @[@"apple",@"bar",@"cherry",@"crown",@"lemon",@"seven"];
    
    [self start:nil];
    
    
    // Do any additional setup after loading the view.
}


//更改难易程度
- (IBAction)segmentContolValueChange:(UISegmentedControl *)sender {
    _hardLevel = sender.selectedSegmentIndex + 2;
}

//开始游戏
- (IBAction)start:(UIButton *)sender {
    
    _winLabel.text = @"";
    
    //声明连续相同的个数
    int sameRowNum = 0;
    int compareRow = 100;
    BOOL isWin = NO;
    
    for (int i = 0; i < 5; i++) {
        //随机数
        int ramNum = round(arc4random() % _images.count);
        if (i == 0) {//为sameRowNum、compareRow赋初值
            sameRowNum = 1;
            compareRow = ramNum;
        }else{
            if (compareRow == ramNum) {
                sameRowNum++;
            }else{
                sameRowNum = 1;
            }
            compareRow = ramNum;
        }
        //更改选中的行
        [_pickerView selectRow:ramNum inComponent:i animated:YES];
        
        if (sameRowNum >= _hardLevel) {
            isWin = YES;
        }
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
    [self play:path];
    
    if (isWin) {
        _winLabel.text = @"win!!!";
        
        NSString *winPath = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
        [self play:winPath];
    }
    
}

-(void)play:(NSString *)soundPath{
    
#if 0 
    //!!!使用initWithContentsOfURL方法来初始化_player的时候要保证音频路径中不包含中文字符，否则创建url失败，创建_player失败
    NSURL *url = [NSURL URLWithString:soundPath];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
#else
    _player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:soundPath] error:nil];
#endif
    _player.delegate = self;
    [_player prepareToPlay];
    [_player play];
    
    
//    SystemSoundID soundId;
//    //把声音文件转化成nsurl 把nsurl强转成 CFURLRef
//    CFURLRef ref = (__bridge CFURLRef)[NSURL fileURLWithPath:soundPath];
//    //用ref创建soundID
//    AudioServicesCreateSystemSoundID(ref, &soundId);
//    //根据soundId进行播放声音
//    AudioServicesPlaySystemSound(soundId);
    
}

#pragma mark -UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _images.count;
}

#pragma mark -UIPickerViewDelegate

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_images[row]]];
    return imageView;
}

//行高
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 80;
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
