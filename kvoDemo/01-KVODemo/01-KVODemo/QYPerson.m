//
//  QYPerson.m
//  01-KVODemo
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "QYPerson.h"

@implementation QYPerson
-(instancetype)init{
    if (self = [super init]) {
        _name = @"zhangsan";
        _age = 18;
    }
    return self;
}
@end
