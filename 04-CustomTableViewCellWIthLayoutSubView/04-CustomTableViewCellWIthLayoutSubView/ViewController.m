//
//  ViewController.m
//  04-CustomTableViewCellWIthLayoutSubView
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba"];
    
    //设置行高
    self.tableView.rowHeight = 100;
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[QYTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    //设置标题
    cell.textLabel.text = _datas[indexPath.row];
    //设置副标题
    cell.detailTextLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    //设置图标
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",indexPath.row]];
    
    //设置UISwitch的状态
    cell.sw.on = indexPath.row % 2 ? YES : NO;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
