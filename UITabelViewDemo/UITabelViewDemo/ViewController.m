//
//  ViewController.m
//  UITabelViewDemo
//
//  Created by qingyun on 15/12/1.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建TabView
    UITableView *tabelView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tabelView];
    
    //设置数据源
    tabelView.dataSource = self;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"first", @"second", @"third"];
    }
    return _dataSource;
}

#pragma mark -UITableViewDataSoure
//设置TablView中的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//设置组中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

//设置每行具体内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qingfeng"];
#if 0
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld组，第%ld行",indexPath.section, indexPath.row];
#else
    cell.textLabel.text = self.dataSource[indexPath.row];
#endif
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
