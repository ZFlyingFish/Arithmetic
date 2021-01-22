//
//  FYUnionFind.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYUnionFind.h"


@implementation FYUnionFind

- (instancetype)initWithNum:(int)capacity {
    
    self = [super init];
    
    if (self) {
        
        self.parents = [NSMutableArray arrayWithCapacity:capacity];
        
        for (int i = 0; i < capacity; i++) {
            
            self.parents[i] = @(i);
            
        }
    }
    return self;
}


///// 查找v所属集合的根节点
//- (int)find:(int)v {
//
//    return 0;
//}
//
//
///// 合并v1、v2所在的集合
//- (void)unionData:(int)v1 and:(int)v2 {
//
//
//}

/// 检查v1、v2是否属于同一个集合
- (BOOL)isSame:(int)v1 and:(int)v2 {
    
    return [self find:v1] == [self find:v2];
    
}

- (void)rangeCheck:(int)v {
    
    if (v < 0 || v >= self.parents.count) {
                
        [NSException raise:@"越界" format:@"元素不在集合里面"];
    }
}



@end
