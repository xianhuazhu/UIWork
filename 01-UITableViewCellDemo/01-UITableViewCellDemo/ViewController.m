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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITableViewDataSource

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
//单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
#if 0
    //从重用队列取闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:indexPath.row % 4 reuseIdentifier:identifier];
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
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
