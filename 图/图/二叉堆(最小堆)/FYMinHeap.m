//
//  FYMinHeap.m
//  图
//
//  Created by 毛 on 2020/12/24.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

// 二叉堆 的数据结构相当于 完全二叉树
// 叶子节点 元素数量 除以 2 向下取整

#import "FYMinHeap.h"

@interface FYMinHeap ()

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) NSMutableArray *elements;

@property (nonatomic, strong) comparatorBlock block;

@end

@implementation FYMinHeap

- (instancetype)initWith:(NSMutableArray *)elements comparator:(comparatorBlock)block {
    
    self = [super init];
    if (self) {
        
        self.size = elements.count;
        
        self.elements = [NSMutableArray array];

        self.block = block;
        
        if (self.size != 0) {
            
            [self.elements addObjectsFromArray:elements];
            [self heapify];
        }
    }
    return self;
}

#pragma mark - 原地建堆
- (void)heapify {
    
    // 二叉堆 的数据结构相当于 完全二叉树
    // 叶子节点 元素数量 除以 2 向下取整

    // 自下而上的下滤
    // 数组中非叶子节点（self.size >> 1） 从上往下 下虑  完成之后堆就完成了
    for (NSInteger i = (self.size >> 1) - 1; i >= 0; i--) {
       
        [self siftDown:i];
    }
}

#pragma mark - 获取size
- (NSInteger)getSize {
    
    return _size;
}

#pragma mark - 判断堆是否为空
- (BOOL)isEmpty {
    
    return self.size == 0;
}

#pragma mark - 向堆中添加元素（多个）
- (void)addAll:(NSMutableArray *)arr {
    
    if (arr.count == 0) return;
    
    for (id element in arr) {
        
        [self add:element];
    }
}

#pragma mark - 向堆中添加元素 （单个）
- (void)add:(id)element {

    if (element == nil) return;

    [self.elements addObject:element];
    
    self.size ++;
    
    [self siftUp:self.size - 1];
}

#pragma mark - 删除堆顶元素 并返回被删除的元素
- (id)remove {
    
    if (self.size == 0) return nil;
    
    id a = self.elements[0];
    
    [self.elements exchangeObjectAtIndex:self.size - 1 withObjectAtIndex:0];
    
    [self.elements removeLastObject];
    
    --self.size;
    if (self.size != 0) {
       
        [self siftDown:0];
    }
    
    return a;
}

#pragma mark - 清空堆
- (void)clear {
    
    [self.elements removeAllObjects];
    
    self.size = 0;
}

#pragma mark - 自下而上的上滤
- (void)siftUp:(NSInteger)index {
    
    //获取元素
    id element = self.elements[index];
    
    while (index > 0) {
        // 获取父节点的索引
        NSInteger parentIndex = (index - 1) >> 1;
        //拿到父节点
        id parent = self.elements[parentIndex];
        
        //如果叶子节点大于等于父节点 退出循环（找到元素储存的位置了）
        if (self.block(element, parent) >= 0) break;
        //叶子节点小于父节点 父节点占用子节点的位置
        self.elements[index] = parent;
        //index 变成 父节点的位置 继续循环与父节点的父节点比较 直到找到element该存储的位置
        index = parentIndex;
    }
    //找到element该存储的位置 放入该位置
    self.elements[index] = element;
    
}

#pragma mark - 自上而下的下滤
- (void)siftDown:(NSInteger)index {
    
    //获取元素
    id element = self.elements[index];
    
    //获取第一个叶子节点的索引
    NSInteger half = self.size >> 1;
    
    // 第一个叶子节点的索引 == 非叶子节点的数量
    // index < 第一个叶子节点的索引
    // 必须保证index位置是非叶子节点
    while (index < half) {
        
        // index的节点有2种情况
        // 1.只有左子节点
        // 2.同时有左右子节点
            
        // 默认为左子节点跟它进行比较
        NSInteger childIndex = (index << 1) + 1;
        id child = self.elements[childIndex];
        
        // 右子节点
        NSInteger rightIndex = childIndex + 1;
        
        // 选出左右子节点最小的那个
        if (rightIndex < self.size && self.block(self.elements[rightIndex], child) < 0) {
            child = self.elements[childIndex = rightIndex];
        }
        
        if (self.block(element, child) <= 0) break;
        
        // 将子节点存放到index位置
        self.elements[index] = child;
        // 重新设置index
        index = childIndex;
    }
    //找到element 应该放的位置给放上去
    self.elements[index] = element;
}


@end
