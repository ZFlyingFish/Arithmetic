//
//  FYUnionFind.h
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYUnionFind : NSObject

// 数组index：某节点  value：该节点的父节点
@property (nonatomic, strong) NSMutableArray *parents;

- (instancetype)initWithNum:(int)capacity;

/// 查找v所属集合的根节点
- (int)find:(int)v;

/// 合并v1、v2所在的集合
- (void)unionData:(int)v1 and:(int)v2;

/// 检查v1、v2是否属于同一个集合
- (BOOL)isSame:(int)v1 and:(int)v2;

- (void)rangeCheck:(int)v;

@end

NS_ASSUME_NONNULL_END
