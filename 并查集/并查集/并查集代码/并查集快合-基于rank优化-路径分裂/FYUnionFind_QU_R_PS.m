//
//  FYUnionFind_QU_R_PS.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QU_R_PS.h"

@implementation FYUnionFind_QU_R_PS

- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];
    
    return self;
}

/// 查找v所属集合的根节点
- (int)find:(int)v {
    
    [self rangeCheck:v];
    
    while (v != [self.parents[v] intValue]) {
        
        int p = [self.parents[v] intValue];
        
        self.parents[v] = self.parents[[self.parents[v] intValue]];
        
        v = p;
    }
    return v;
}

// 合并的时候 ranks 里面的记录的高度就有问题了 但是我认为合并的时候 高度只是起到了谁像谁合并不影响并查集结果

@end
