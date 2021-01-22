//
//  FYStack.m
//  图
//
//  Created by 毛 on 2020/12/23.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYStack.h"

@interface FYStack ()

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, assign) int size;

@end

@implementation FYStack

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.size = 0;
    }
    return self;
}

/// 入栈
/// @param obj 元素
- (void)pushObject:(id)obj {
    
    if ([self.array containsObject:obj] || obj == nil) return;

    [self.array addObject:obj];
    
    self.size++;
    
}

/// 栈顶元素出栈并返回
- (id)popObject {
    
    if (self.size == 0) return nil;
    
    id a = [self.array lastObject];
    
    [self.array removeLastObject];
    
    self.size--;
    
    return a;
    
}

/// 返回栈顶元素 不删除栈内元素
- (id)topObject {
    
    if (self.size == 0) return nil;

    return [self.array lastObject];
}

/// 栈是否为空
- (BOOL)isEmpty {
    
    return self.size == 0 ? YES : NO;
}


@end
