//
//  SecondTableViewController.m
//  03-UISearchController
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()<UISearchResultsUpdating>
@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSArray *results;

@end

@implementation SecondTableViewController
static NSString *identifier = @"cell";
-(void)loadDatas
{
    _datas = @[@"Here's", @"to", @"the", @"crazy", @"ones.", @"The", @"misfits.", @"The", @"rebels.", @"The", @"troublemakers.", @"The", @"round", @"pegs", @"in", @"the", @"square", @"holes.", @"The", @"ones", @"who", @"see", @"things", @"differently.", @"They're", @"not", @"fond", @"of", @"rules.", @"And", @"they", @"have", @"no", @"respect", @"for", @"the", @"status", @"quo.", @"You", @"can", @"quote", @"them,", @"disagree", @"with", @"them,", @"glorify", @"or", @"vilify", @"them.", @"About", @"the", @"only", @"thing", @"you", @"can't", @"do", @"is", @"ignore", @"them.", @"Because", @"they", @"change", @"things.", @"They", @"push", @"the", @"human", @"race", @"forward.", @"And", @"while", @"some", @"may", @"see", @"them", @"as", @"the", @"crazy", @"ones,", @"we", @"see", @"genius.", @"Because", @"the", @"people", @"who", @"are", @"crazy", @"enough", @"to", @"think", @"they", @"can", @"change", @"the", @"world,", @"are", @"the", @"ones", @"who", @"do."];
    
    _results = _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
//    //searchBar添加在导航栏上
//    self.navigationItem.titleView = _searchController.searchBar;
//    _searchController.hidesNavigationBarDuringPresentation = NO;
    //设置更新结果的对象
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    
    //设置searchBar的frame
    _searchController.searchBar.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    self.tableView.tableHeaderView = _searchController.searchBar;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _results.count;
}

//单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _results[indexPath.row];
    
    return cell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    if ([searchController.searchBar.text isEqualToString:@""]) {
        _results = _datas;
        [self.tableView reloadData];
        return;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD] %@",searchController.searchBar.text];
    
    _results = [_datas filteredArrayUsingPredicate:predicate];
    
    [self.tableView reloadData];
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
