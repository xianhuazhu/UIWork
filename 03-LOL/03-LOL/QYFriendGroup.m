//
//  QYFriendGroup.m
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYFriendGroup.h"
#import "QYFriend.h"
@implementation QYFriendGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //遍历friends，把字典转化成QYFriend
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            QYFriend *friend = [QYFriend friendWithDictionary:dic];
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}

+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
