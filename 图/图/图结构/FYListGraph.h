//
//  FYListGraph.h
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYVertex.h"
#import "FYEdge.h"
#import "FYQueue.h"
#import "FYStack.h"
#import "FYMinHeap.h"
#import "FYGenericUnionFind.h"
#import "FYPathInfo.h"

NS_ASSUME_NONNULL_BEGIN

typedef int(^comparatorBlock)(id weight1,id weight2);
typedef BOOL(^visitor)(id value);

@interface FYListGraph : NSObject

/// 存放顶点的字典
@property (nonatomic, strong) NSMutableDictionary *vertices;

/// 存放边的集合
@property (nonatomic, strong) NSMutableSet *edges;

/// 获取边的
- (NSInteger)edgesSize;

/// 获取顶点数
- (NSInteger)verticesSize;

/// 添加顶点 from 到顶点 to 权重为nil 的边
- (void)addEdge:(id)from to:(id)to;

/// 添加顶点 from 到顶点 to 权重为weight 的边
/// @param from 顶点 from
/// @param to 顶点 to
/// @param weight 权重
- (void)addEdge:(id)from to:(id)to weight:(id)weight;

/// 删除顶点 from 到顶点 to 的边
/// @param from 顶点 from
/// @param to to 顶点 to
- (void)removeEdge:(id)from to:(id)to;

/// 删除顶点
/// @param v 顶点 V
- (void)removeVertex:(id)v;

/// 广度优先搜索
/// @param begin 开始的搜索的顶点
/// @param block  block 返回值为NO 停止遍历  block(返回当前遍历到的值)
- (void)bfs:(id)begin visitor:(visitor)block;

/// 深度优先搜索
/// @param begin  开始的搜索的顶点
/// @param block  block 返回值为NO 停止遍历  block(返回当前遍历到的值)
- (void)dfs:(id)begin visitor:(visitor)block;

/// 拓扑排序 （有向无环图才能进行）入度的顶点肯定在出度的顶点后面打印  能诠释依赖关系
- (NSMutableArray *)topologicalSort;

/// 双向图 求最小生成树
/// @param block 权重比较器
- (NSMutableSet *)prim:(comparatorBlock)block;

/// 双向图 求最小生成树
/// @param block 权重比较器
- (NSMutableSet *)kruskal:(comparatorBlock)block;


/// 获取begin起始到图中所有点的最短路径  不能有负权边
/// @param begin 起始点
- (NSMutableDictionary *)shortestPath:(id)begin comparator:(comparatorBlock)block;



@end

NS_ASSUME_NONNULL_END
