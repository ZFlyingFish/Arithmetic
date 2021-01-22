//
//  FYNode.m
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYNode.h"

@implementation FYNode

- (instancetype)initWith:(id)value {
    
    self = [super init];
    
    if (self) {
        
        self.value = value;
        // 初始化节点以后 该节点的Parent 指向的自己
        __weak __typeof(&*self)weakSelf = self;
        self.parent = weakSelf;
        
        // 初始化节点以后 该节点的rank等于1
        self.rank = 1;
    }
    
    return self;
}






@end
