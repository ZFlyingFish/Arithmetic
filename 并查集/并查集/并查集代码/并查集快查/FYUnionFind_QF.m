//
//  FYUnionFind_QF.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QF.h"

@implementation FYUnionFind_QF


- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];

    return self;
}

/// 查找v所属集合的根节点
- (int)find:(int)v {
    
    [self rangeCheck:v];
    //父节点就是根节点  index 对应位置存的就是根节点的值
    return [self.parents[v] intValue];
}

/// 合并v1、v2所在的集合
- (void)unionData:(int)v1 and:(int)v2 {
    
    int p1 = [self find:v1];
    int p2 = [self find:v2];
    
    if (p1 == p2) return;
    
    // 合并v1、v2所在的集合   找到v1的根节点  把所有指点根节点的index  都换成v2 的根节点
    for (int i = 0; i < self.parents.count; i++) {
        
        if ([self.parents[i] intValue] == p1) {
            
            self.parents[i] = @(p2);
        }
    }
}


@end
