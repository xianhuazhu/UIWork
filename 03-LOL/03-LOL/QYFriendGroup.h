//
//  QYFriendGroup.h
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendGroup : NSObject
//声明属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic) BOOL isopen;
//声明初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict;

@end
