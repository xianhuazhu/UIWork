//
//  ViewController.m
//  01-UITableViewCellDemo
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identifier = @"qycell";
-(NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"zhaoba"];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    
    //第二种重用单元格方式
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    //允许多选
    self.tableView.allowsMultipleSelection = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITableViewDataSource

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
//单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
#if 1
    //从重用队列取闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:indexPath.row % 4 reuseIdentifier:identifier];
        
        
        //设置背景
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor redColor];
        //cell.backgroundView = bgView;
        
        //设置选中背景
        UIView *selectedBGView = [[UIView alloc] init];
        selectedBGView.backgroundColor = [UIColor greenColor];
        //cell.selectedBackgroundView = selectedBGView;
        
        //cell.multipleSelectionBackgroundView = selectedBGView;
        
        //辅助视图样式(系统提供)
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        //自定义辅助视图
        UISwitch *sw = [[UISwitch alloc]init];
        
        cell.accessoryView = sw;
        
        //选中样式
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        
    }
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
#endif
    //设置imageView
    NSString *imageName = [NSString stringWithFormat:@"icon%ld.jpg",indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageName];
    //设置textLabel
    cell.textLabel.text = self.datas[indexPath.row];
    //设置detailTextLabel
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@--%ld",self.datas[indexPath.row],indexPath.row];
    
    //更改子视图的位置来自定义单元格？？？
    
    CGRect rect = cell.imageView.frame;
    
    rect.origin.x += 200;
    
    cell.imageView.frame = rect;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
