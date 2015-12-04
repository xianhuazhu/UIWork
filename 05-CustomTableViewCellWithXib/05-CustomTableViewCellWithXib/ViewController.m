//
//  ViewController.m
//  05-CustomTableViewCellWithXib
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[@{@"title":@"zhangsan",@"subTitle":@"高富帅",@"imageName":@"icon0.jpg",@"isOn":@1},
               @{@"title":@"lisi",@"subTitle":@"屌丝",@"imageName":@"icon1.jpg",@"isOn":@0},
               @{@"title":@"wangwu",@"subTitle":@"白富美",@"imageName":@"icon2.jpg",@"isOn":@1},
               @{@"title":@"zhaoliu",@"subTitle":@"极品女士",@"imageName":@"icon3.jpg",@"isOn":@0},
               @{@"title":@"tianqi",@"subTitle":@"码农",@"imageName":@"icon4.jpg",@"isOn":@0},
               @{@"title":@"songba",@"subTitle":@"大神",@"imageName":@"icon5.jpg",@"isOn":@1}];
    
    UITableView *tabelView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tabelView];
    
    //设置数据源、代理
    tabelView.dataSource = self;
    tabelView.delegate = self;
    
    //行高
    tabelView.rowHeight = 100;
    
    //注册单元格
    [tabelView registerNib:[UINib nibWithNibName:@"QYTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
#if 0
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil][0];
    }
#else
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
#endif
    
    NSDictionary *dict = _datas[indexPath.row];
    
    cell.titleLabel.text = dict[@"title"];
    
    cell.detailTitleLabel.text = dict[@"subTitle"];
    
    cell.sw.on = [dict[@"isOn"] boolValue];
    
    cell.imgView.image = [UIImage imageNamed:dict[@"imageName"]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
