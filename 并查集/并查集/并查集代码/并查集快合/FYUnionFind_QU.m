//
//  FYUnionFind_QU.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QU.h"

@implementation FYUnionFind_QU

- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];

    return self;
}

/// 查找v所属集合的根节点
- (int)find:(int)v {
    
    [self rangeCheck:v];
    
    // 当 v 位置存的Value不等于v时 则表示 v 的父节点不是 v  则 把value的值赋值给v 只有找到 index 与 value 相等则表示 v 为根节点
    while (v != [self.parents[v] intValue]) {
        
         v = [self.parents[v] intValue];
    }
    
    return v;
}

/// 合并v1、v2所在的集合
- (void)unionData:(int)v1 and:(int)v2 {
    
    int p1 = [self find:v1];
    int p2 = [self find:v2];
    
    if (p1 == p2) return;

    //将v1的根节点嫁接到v2的根节点上
    self.parents[p1] = @(p2);
    
}
@end
