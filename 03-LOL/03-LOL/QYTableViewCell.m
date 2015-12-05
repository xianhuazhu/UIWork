//
//  QYTableViewCell.m
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYTableViewCell.h"
#import "QYFriend.h"
@implementation QYTableViewCell

-(void)setFriend:(QYFriend *)friend{
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
