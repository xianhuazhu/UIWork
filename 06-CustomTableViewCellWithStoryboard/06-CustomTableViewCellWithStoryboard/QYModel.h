//
//  QYModel.h
//  06-CustomTableViewCellWithStoryboard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYModel : NSObject
//声明属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic) BOOL ison;

//初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
