//
//  QYViewD.m
//  01-TouchDemo
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "QYViewD.h"

@implementation QYViewD

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.multipleTouchEnabled = YES;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.multipleTouchEnabled = YES;
    }
    return self;
}


-(void)addLitterViewWithTouches:(NSSet<UITouch *> *)touches{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    UIView *litterView = [[UIView alloc] initWithFrame:CGRectMake(point.x - 2, point.y - 2, 4, 4)];
    litterView.backgroundColor = [UIColor redColor];
    [self addSubview:litterView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches:%@",touches);
    
    NSLog(@"%s",__func__);
    
    [self addLitterViewWithTouches:touches];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [self addLitterViewWithTouches:touches];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
