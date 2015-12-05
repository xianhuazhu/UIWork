//
//  QYSectionHeaderView.h
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYFriendGroup;
@interface QYSectionHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) QYFriendGroup *friendGroup;
@property (nonatomic, strong) void (^headerViewClick)(void);
+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;
@end
