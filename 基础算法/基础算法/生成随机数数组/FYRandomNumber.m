//
//  FYRandomNumber.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/3.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYRandomNumber.h"

@implementation FYRandomNumber

+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min {
    
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < num; i++) {
            
        NSInteger a = (NSInteger)(min + (arc4random() % ((max - min) + 1)));
        
        [arr addObject:@(a)];
    }
    
    return arr;
    
}

+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min tail:(NSInteger)tailNum {
    
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < num - tailNum; i++) {
            
        NSInteger a = (NSInteger)(min + (arc4random() % ((max - min) + 1)));
        
        [arr addObject:@(a)];
    }
    
    for (int i = 0; i < tailNum; i++) {
        
        [arr addObject:@(max)];
    }
    
    return arr;
    
}

@end
