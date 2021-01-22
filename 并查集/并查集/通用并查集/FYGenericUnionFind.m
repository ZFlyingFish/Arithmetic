//
//  FYGenericUnionFind.m
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYGenericUnionFind.h"

@interface FYGenericUnionFind ()

@property (nonatomic, strong) NSMutableDictionary *nodeDic;

@end

@implementation FYGenericUnionFind

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.nodeDic = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - 并查集 每个元素 对应一个node节点存储在字典里
- (void)markSet:(id)value {
    
    if ([[self.nodeDic allKeys] containsObject:value]) return;
    
    [self.nodeDic setObject:[[FYNode alloc] initWith:value] forKey:value];
}

#pragma mark - 找出元素的根节点 （路径分裂优化）
- (FYNode *)fandNode:(id)value {
    
    FYNode *node = [self.nodeDic objectForKey:value];
    
    if (node == nil) return nil;
    
    while (![node.value isEqual:node.parent.value]) {
        
        node.parent = node.parent.parent;
        node = node.parent;
    }
    
    return node;
}

#pragma mark - 查找元素 如果并查集里有此元素返回此元素 如没有返回nil
- (id)find:(id)value {
    
    FYNode *node = [self fandNode:value];
    return node == nil ? nil : node.value;
}

#pragma mark - 合并两个元素
- (void)unionValue:(id)value1 and:(id)value2 {
    
    //找到value1、value1的根节点
    FYNode *p1 = [self fandNode:value1];
    FYNode *p2 = [self fandNode:value2];
    
    //如果有一个根节点为空 则退出合并
    if (p1 == nil || p2 == nil) return;
    
    if (p1.rank < p2.rank) {
        
        p1.parent = p2;
    }else if (p1.rank > p1.rank) {
        
        p2.parent = p1;
    }else {
        
        p1.parent = p2;
        p2.rank +=1;
    }
}

#pragma mark - 查询两个元素是否属于同一集合
- (BOOL)isSame:(id)value1 and:(id)value2 {
    
    return [[self find:value1] isEqual:[self find:value2]];
}

@end


