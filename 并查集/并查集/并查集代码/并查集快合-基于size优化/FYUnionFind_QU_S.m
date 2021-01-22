//
//  FYUnionFind_QU_S.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QU_S.h"

@interface FYUnionFind_QU_S ()

@property (nonatomic, strong) NSMutableArray *sizes;

@end

@implementation FYUnionFind_QU_S

- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];

    self.sizes = [NSMutableArray arrayWithCapacity:capacity];
    
    for (int i = 0; i < capacity; i++) {
        
        self.sizes[i] = @(1);
    }
    
    return self;
}

/// 合并v1、v2所在的集合  将v1的根节点嫁接到v2的根节点上
- (void)unionData:(int)v1 and:(int)v2 {
    
    int p1 = [self find:v1];
    int p2 = [self find:v2];
    
    if (p1 == p2) return;


    // 根节点 p1 的size  <  p2 的size    p1 嫁接到 p2 上
    //p2的size 等于 原p2的size 加上 p1 的size
    if ([self.sizes[p1] intValue] < [self.sizes[p2] intValue]) {
        
        self.parents[p1] = @(p2);
        
        int a = [self.sizes[p1] intValue];
        int b = [self.sizes[p2] intValue];
        
        self.sizes[p2] = @(a+b);
        
    } else {
        
        // 根节点 p1 的size  >  p2 的size    p2 嫁接到 p1 上
        //p1的size 等于 原p1的size 加上 p2 的size
        self.parents[p2] = @(p1);
        
        int a = [self.sizes[p1] intValue];
        int b = [self.sizes[p2] intValue];
        
        self.sizes[p1] = @(a+b);
    }
}



@end
