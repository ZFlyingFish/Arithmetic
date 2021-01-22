//
//  FYQueue.m
//  图
//
//  Created by 毛 on 2020/12/23.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYQueue.h"

@interface FYQueue ()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, assign) int size;

@end

@implementation FYQueue

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.size = 0;
    }
    return self;
}

/// 队列添加元素
/// @param obj 元素
- (void)addObject:(id)obj {
    
    if ([self.array containsObject:obj] || obj == nil) return;
    
    [self.array addObject:obj];
    
    self.size++;
}

/// 返回队头元素并删除队列内元素
- (id)removeObject {
    
    if (self.size == 0) return nil;
    
    id a = self.array[0];
    
    [self.array removeObjectAtIndex:0];
    
    self.size--;
    
    return a;
}

/// 返回队头元素 不删除队列内元素
- (id)firstObject {
    
    if (self.size == 0) return nil;
    
    return self.array[0];
}

/// 队列是否为空
- (BOOL)isEmpty {
    
    return self.size == 0 ? YES : NO;
}

@end
