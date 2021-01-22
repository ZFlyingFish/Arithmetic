//
//  FYUnionFind_QU_R.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QU_R.h"

@interface FYUnionFind_QU_R ()

@property (nonatomic, strong) NSMutableArray *ranks;

@end


@implementation FYUnionFind_QU_R

- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];

    self.ranks = [NSMutableArray arrayWithCapacity:capacity];
    
    for (int i = 0; i < capacity; i++) {
        
        self.ranks[i] = @(1);
    }
    
    return self;
}

/// 合并v1、v2所在的集合  将v1的根节点嫁接到v2的根节点上
- (void)unionData:(int)v1 and:(int)v2 {
    
    int p1 = [self find:v1];
    int p2 = [self find:v2];
    
    if (p1 == p2) return;


    // 根节点 p1 的rank  <  p2 的rank    p1 嫁接到 p2 上
    // p2的rank 不变
    if ([self.ranks[p1] intValue] < [self.ranks[p2] intValue]) {
        
        self.parents[p1] = @(p2);
        
    } else if ([self.ranks[p1] intValue] > [self.ranks[p2] intValue]){
        
        // 根节点 p1 的rank  >  p2 的rank    p2 嫁接到 p1 上
        //p1的rank 不变
        self.parents[p2] = @(p1);

    }else {
        
        // 根节点 p1 的rank  =  p2 的rank    p1 嫁接到 p2 上
        // p2的rank +=1
        
        self.parents[p1] = @(p2);

        int b = [self.ranks[p2] intValue];

        self.ranks[p2] = @(b + 1);
    }
}


@end
