//
//  ViewController.m
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYFriendGroup.h"
#import "QYFriend.h"
#import "QYTableViewCell.h"
#import "QYSectionHeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

//懒加载
-(NSArray *)heros{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYFriendGroup *friendGroup = [QYFriendGroup friendGroupWithDictionary:dict];
            [models addObject:friendGroup];
        }
        _heros = models;
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITableViewDataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.heros.count;
}
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    QYFriendGroup *friendGroup = self.heros[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}
//单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[QYTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    QYFriendGroup *friendGroup = self.heros[indexPath.section];
    QYFriend *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}

#if 0
//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    QYFriendGroup *friendGroup = self.heros[section];
    return friendGroup.name;
}
#endif
//section头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
//section头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //创建自定义的section的头视图
    QYSectionHeaderView *headerView = [QYSectionHeaderView sectionHeaderViewForTableView:tableView];
    QYFriendGroup *friendGroup = self.heros[section];
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
    };
    
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
