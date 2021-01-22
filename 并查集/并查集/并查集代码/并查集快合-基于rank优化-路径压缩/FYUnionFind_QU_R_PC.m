//
//  FYUnionFind_QU_R_PC.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind_QU_R_PC.h"

@implementation FYUnionFind_QU_R_PC

- (instancetype)initWithNum:(int)capacity {
    
    self = [super initWithNum:capacity];
    
    return self;
}

/// 查找v所属集合的根节点
- (int)find:(int)v {
    
    [self rangeCheck:v];
    
    //从该节点到根节点这条链上的所有节点都指向父节点了
    if (v != [self.parents[v] intValue]) {
        
        v = [self.parents[v] intValue];
        
        self.parents[v] = @([self find:[self.parents[v] intValue]]);
    }

    return [self.parents[v] intValue];
}

// 合并的时候 ranks 里面的记录的高度就有问题了 但是我认为合并的时候 高度只是起到了谁像谁合并不影响并查集结果






@end
