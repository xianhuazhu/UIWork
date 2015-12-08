//
//  FourthViewController.m
//  01-选择器
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSDictionary *dict;

//左列数据
@property (nonatomic, strong) NSArray *leftDatas;
//右列的数据
@property (nonatomic, strong) NSArray *rightDatas;
@end

@implementation FourthViewController

//加载数据
-(void)loadDataFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"statedictionary" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    //左数据
    _leftDatas = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
    
    //右数据
    _rightDatas = _dict[_leftDatas.firstObject]; 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataFromFile];
    // Do any additional setup after loading the view.
}
- (IBAction)btnClick:(UIButton *)sender {
}

#pragma mark -UIPickerViewDataSource

//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

//行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {//左列行数
        return _leftDatas.count;
    }
    //右列行数
    return _rightDatas.count;
}

#pragma mark -UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {//左列内容
        return _leftDatas[row];
    }
    return _rightDatas[row];
}

//选中行数
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {//操作左列
        //更改右列的数据
        NSString *key = _leftDatas[row];
        _rightDatas = _dict[key];
        
        //刷新右列
        [pickerView reloadComponent:1];
        //更改右列选中的行为0
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

//每列宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0) {
        return 100;
    }
    return 200;
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
