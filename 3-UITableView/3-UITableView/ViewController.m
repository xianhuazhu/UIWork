//
//  ViewController.m
//  3-UITableView
//
//  Created by qingyun on 15/12/1.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.sectionHeaderHeight = 40;
    tableView.sectionFooterHeight = 40;
    tableView.separatorColor = [UIColor blueColor];
    tableView.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.allowsSelection = YES;
    //tableView.allowsMultipleSelection = YES;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    headerLabel.backgroundColor = [UIColor orangeColor];
    headerLabel.text = @"LableText";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont boldSystemFontOfSize:24];
    tableView.tableHeaderView = headerLabel;
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    footerLabel.backgroundColor = [UIColor purpleColor];
    footerLabel.text = @"LableTextFooter";
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.font = [UIFont boldSystemFontOfSize:24];
    tableView.tableFooterView = footerLabel;
    
}

#pragma mark -datas
- (NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"first", @"second", @"third", @"fourth"];
    }
    return _datas;
}

#pragma mark -NumberOfSection
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

#pragma mark -NumberOfRowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

#pragma mark -对row高的设置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        return 50;
    }
    return 40;
}

#pragma mark -CellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    tableViewCell.textLabel.text = self.datas[indexPath.row];
    return tableViewCell;
}

#pragma mark -ViewForHeaderInSection
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerViewLabel = [[UILabel alloc] init];
    headerViewLabel.text = [NSString stringWithFormat:@"Section:%ld",section];
    headerViewLabel.textAlignment = NSTextAlignmentCenter;
    headerViewLabel.textColor = [UIColor blackColor];
    
    return headerViewLabel;
}

#pragma mark -ViewForFooterInSection
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *footerLabel = [[UILabel alloc] init];
    footerLabel.text = [NSString stringWithFormat:@"Section:%ld",section];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    
    return footerLabel;
}

#pragma mark -HeightForHeader And Footer InSection
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 55;
}

#pragma mark -TitleForHeaderInSection
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section:%ld",section];
}

#pragma mark -TitleForFooterInSection
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section:%ld",section];
}

#pragma mark -高亮显示
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s, (%ld,%ld)",__func__, indexPath.section,indexPath.row);
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark -设置辅助视图
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
