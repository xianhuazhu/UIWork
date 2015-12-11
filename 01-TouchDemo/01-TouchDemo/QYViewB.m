//
//  QYViewB.m
//  01-TouchDemo
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "QYViewB.h"

@implementation QYViewB

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    
    UITouch *touch = [touches anyObject];
    
    //当前触摸的位置
    CGPoint point = [touch locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    NSUInteger tapCount = touch.tapCount;
    NSLog(@"touch's tap count:%lu",(unsigned long)tapCount);
    
    if (tapCount == 1) {
        [self performSelector:@selector(singleTap) withObject:nil afterDelay:0.5];
    }else{
        [self doubleTap];
    }
    
}
//单击
-(void)singleTap{
    NSLog(@"单击");
}

-(void)doubleTap{
    //取消单击
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap) object:nil];
    NSLog(@"双击");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
