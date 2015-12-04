//
//  QYTableViewCell.h
//  06-CustomTableViewCellWithStoryboard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYModel;
@interface QYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISwitch *sw;


@property (nonatomic, strong) QYModel *model;
@end
