//
//  ViewController.m
//  01-刷新和加载更多
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //注册单元格
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    tableView.rowHeight = 150;
    
    _datas = [NSMutableArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba", nil];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [tableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    
    //添加尾视图
    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    footerBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    [footerBtn setTitle:@"加载更多..." forState:UIControlStateNormal];
    footerBtn.backgroundColor = [UIColor redColor];
    [footerBtn addTarget:self action:@selector(loadMoreSource) forControlEvents:UIControlEventTouchUpInside];
    //tableView.tableFooterView = footerBtn;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadMoreSource{
    [_datas addObject:@"没有更多了"];
    [_tableView reloadData];
}

//刷新
-(void)refresh:(UIRefreshControl *)refreshControl{
    [refreshControl performSelector:@selector(endRefreshing) withObject:nil afterDelay:5];
}

#pragma mark  -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_tableView.contentOffset.y > (_tableView.contentSize.height - _tableView.frame.size.height) + 100) {
        [self loadMoreSource];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
