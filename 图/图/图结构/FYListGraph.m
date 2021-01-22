//
//  FYListGraph.m
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYListGraph.h"


@implementation FYListGraph

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.vertices = [NSMutableDictionary dictionary];
        self.edges = [NSMutableSet set];
        
    }
    return self;
}

#pragma mark - 获取图中有多少边
- (NSInteger)edgesSize {
    
    return self.edges.count;
}
#pragma mark - 获取图中有多少顶点
- (NSInteger)verticesSize {
    
    return self.vertices.count;
}

#pragma mark - 添加顶点 from 到顶点 to 边
- (void)addEdge:(id)from to:(id)to {
    
    [self addEdge:from to:to weight:nil];
}

#pragma mark - 添加顶点 from 到顶点 to 权重为weight 的边
- (void)addEdge:(id)from to:(id)to weight:(id)weight {
    
    //获取from（出发）顶点
    FYVertex *fromVertex = [self.vertices objectForKey:from];
    //如果顶点为空则创建新顶点
    if (fromVertex == nil) {

        //创建新顶点
        fromVertex = [[FYVertex alloc] initWith:from];
        //新顶点存起来
        [self.vertices setObject:fromVertex forKey:from];
    }
    
    //获取to（到达）顶点
    FYVertex *toVertex = [self.vertices objectForKey:to];
    //如果顶点为空则创建新顶点
    if (toVertex == nil) {

        //创建新顶点
        toVertex = [[FYVertex alloc] initWith:to];
        //新顶点存起来
        [self.vertices setObject:toVertex forKey:to];
    }
    
    //创建一条边
    FYEdge *edge = [[FYEdge alloc] initWithFrom:fromVertex to:toVertex];
    //权重赋值
    edge.weight = weight;
    
    //如果 from顶点出来的边集合里包含边edge
    if ([fromVertex.outEdge containsObject:edge]) {
        
        //清空from顶点出来的边集合里的edge
        [fromVertex.outEdge removeObject:edge];
        //清空to顶点进来的边集合里的edge
        [toVertex.inEdge removeObject:edge];
        //边集合里删除此边
        [self.edges removeObject:edge];
    }
    
    //from顶点出来的边集合添加edge
    [fromVertex.outEdge addObject:edge];
    //to顶点进来的边集合添加edge
    [toVertex.inEdge addObject:edge];
    //此边添加到edges集合里
    [self.edges addObject:edge];
}

#pragma mark - 删除form 到 to的边
- (void)removeEdge:(id)from to:(id)to {
    
    //获取from（出发）顶点
    FYVertex *fromVertex = [self.vertices objectForKey:from];
    //如果顶点为空则创建新顶点
    if (fromVertex == nil) return;
    
    //获取to（到达）顶点
    FYVertex *toVertex = [self.vertices objectForKey:to];
    //如果顶点为空则创建新顶点
    if (toVertex == nil) return;
    
    //创建一条边
    FYEdge *edge = [[FYEdge alloc] initWithFrom:fromVertex to:toVertex];
    
    // 如果出发顶点出去的边包含此边
    if ([fromVertex.outEdge containsObject:edge]) {
        
        //删除出发顶点出去的此边  到达顶点的此边  边集合的此边
        [fromVertex.outEdge removeObject:edge];
        [toVertex.inEdge removeObject:edge];
        [self.edges removeObject:edge];
    }
    
}

- (void)removeVertex:(id)v {
    
    //获取顶点
    FYVertex *vertex = [self.vertices objectForKey:v];

    //如果顶点为空则退出删除
    if (vertex == nil) return;
    
    //遍历 顶点进来的边集合
    for (FYEdge *edge in vertex.inEdge) {

        //删除顶点进来边的 出发顶点的 出去边集合的边edge
        [edge.fromVertex.outEdge removeObject:edge];
        //维护边集合 删除此边
        [self.edges removeObject:edge];
    }
    //删除顶点进来的边集合
    [vertex.inEdge removeAllObjects];
    
    //遍历 顶点出去的边集合
    for (FYEdge *edge in vertex.outEdge) {

        //删除顶点出去边的 到达顶点的 进来边集合的边edge
        [edge.toVertex.inEdge removeObject:edge];
        //维护边集合 删除此边
        [self.edges removeObject:edge];
    }

    //删除顶点进来的边集合
    [vertex.outEdge removeAllObjects];
    
    //维护顶点集合  删除顶点
    [self.vertices removeObjectForKey:v];
}

#pragma mark - 广度有限搜索  类似于二叉树的层序便利
/// 层序便利 使用的队列 一层一层入队 一层一层出队  来便利
- (void)bfs:(id)begin visitor:(visitor)block {
    
    //获取开始顶点
    FYVertex *beginVertex = [self.vertices objectForKey:begin];
    if (beginVertex == nil) return;
    
    //声明一个集合 用于过滤已经搜索出来的节点
    NSMutableSet *visitedVertices = [NSMutableSet set];
    //声明一个队列
    FYQueue *queue = [[FYQueue alloc] init];
    [queue addObject:beginVertex];
    [visitedVertices addObject:beginVertex];
        
    while (![queue isEmpty]) {
        
        //取出队头元素
        FYVertex *vertex = [queue removeObject];
                
        if (!block(vertex.value))return;;
        
        for (FYEdge *edge in vertex.outEdge) {
            
            if ([visitedVertices containsObject:edge.toVertex]) continue;
            
            [queue addObject:edge.toVertex];
            [visitedVertices addObject:edge.toVertex];

        }
    }
}

#pragma mark - 深度优先搜索
/// 类似于中序便利  使用的栈模拟的递归调用
- (void)dfs:(id)begin visitor:(visitor)block{
    
    //获取开始顶点
    FYVertex *beginVertex = [self.vertices objectForKey:begin];
    if (beginVertex == nil) return;
    
    //声明一个集合 用于过滤已经搜索出来的节点
    NSMutableSet *visitedVertices = [NSMutableSet set];
    
    FYStack *stack = [[FYStack alloc] init];
    
    [stack pushObject:beginVertex];
    
    if (!block(beginVertex.value)) return;;

    [visitedVertices addObject:beginVertex];
    
    while (![stack isEmpty]) {
        
        FYVertex *vertex = [stack popObject];

        for (FYEdge *edge in vertex.outEdge) {
            
            if ([visitedVertices containsObject:edge.toVertex]) continue;

            [stack pushObject:edge.fromVertex];
            [stack pushObject:edge.toVertex];
            [visitedVertices addObject:edge.toVertex];

            if (!block(edge.toVertex.value)) return;;

            break;
        }
    }
}

#pragma mark - 拓扑排序 （有向无环图才能进行）入度的顶点肯定在出度的顶点后面打印  能诠释依赖关系
/// 所有入度为0 的节点入队列  依次出队 到达顶点入度-1 （如果-1之后入度为0 则加入队列  不为0 则修改顶点的入度数）
- (NSMutableArray *)topologicalSort {
    
    //返回的顺序顶点的value
    NSMutableArray *arr = [NSMutableArray array];
    //用于排序的队列
    FYQueue *queue = [[FYQueue alloc] init];
    //记录顶点的入度数量
    NSMutableDictionary *ins = [NSMutableDictionary dictionary];
    
    //便利所有顶点 入度为0 的节点入队列
    for (id form in [self.vertices allKeys]) {
        
        FYVertex *vertex = [self.vertices objectForKey:form];
        
        NSInteger inIn = vertex.inEdge.count;
        
        if (inIn == 0) {
            
            [queue addObject:vertex];
        }else {
            
            [ins setObject:@(inIn) forKey:vertex];
        }
    }
    
    //如果队列不为空 则一直循环下去
    while (![queue isEmpty]) {
        
        //取出队头元素
        FYVertex *vertex = [queue removeObject];
        
        [arr addObject:vertex.value];
        
        for (FYEdge *edge in vertex.outEdge) {
            
            NSInteger toIn = [[ins objectForKey:edge.toVertex] integerValue] - 1;
            if (toIn == 0) {
                [queue addObject:edge.toVertex];
            }else {
                
                [ins setObject:@(toIn) forKey:edge.toVertex];
            }
        }
    }
    
    return arr;
}

#pragma mark - 最小生成树
/// 获取一个顶点 开始切出度的边  最小边到达的顶点 的出度的边 加入最小堆 继续切 循环往复
- (NSMutableSet *)prim:(comparatorBlock)block {
    
    //获取所有顶点的数组
    NSArray *valueArr = [self.vertices allValues];
    
    if (valueArr.count == 0) return nil;
    
    //最小生成树的集合
    NSMutableSet *edgeInfos = [NSMutableSet set];
    //记录顶点
    NSMutableSet *addedVertices = [NSMutableSet set];

    //获取一个顶点（这个随机回去就行）
    FYVertex *vertex = valueArr[1];
    //把顶点加入集合
    [addedVertices addObject:vertex];

    //选择顶点的出去的边
    NSArray *sortSetArray = [vertex.outEdge allObjects];
    
    //选择顶点出去的边 建最小堆
    //_Nonnull 关键词 不能为空的意思
    FYMinHeap *heap = [[FYMinHeap alloc] initWith:[sortSetArray mutableCopy] comparator:block];
    
    //获取顶点数量
    NSInteger verticesSize = self.vertices.count;

    //堆不为空 并且得到边集合数量等于节点数量-1 退出循环
    while (![heap isEmpty] && addedVertices.count < verticesSize) {
        
        //获取到当前堆的顶点  最小权值的边
        FYEdge *edge = (FYEdge *)[heap remove];

        //过滤集合addedVertices 里面有边到达的顶点了就退出当前循环
        if ([addedVertices containsObject:edge.toVertex]) continue;
        
        //权重加入返回数组
        [edgeInfos addObject:edge.weight];

        //到达顶点加入过滤集合
        [addedVertices addObject:edge.toVertex];

        NSArray *sortSetArray = [edge.toVertex.outEdge allObjects];
        //到达顶点的进入边加入堆中
        [heap addAll:[sortSetArray mutableCopy]];
    }
    
    return edgeInfos;
}

#pragma mark - 最小生成树
/// 所有最小边 加入最小堆   最小边出堆  只要出的边与已经出来的不在一个 并查集里边 则为最小生成树的边 否则不是
- (NSMutableSet *)kruskal:(comparatorBlock)block {
    
    //获取所有顶点的数组
    NSArray *valueArr = [self.vertices allValues];
    
    if (valueArr.count == 0) return nil;
    
    NSInteger edgeSize = valueArr.count - 1;
    
    //最小生成树边的集合
    NSMutableSet *edgeInfos = [NSMutableSet set];
    
    //所有边生成最小堆
    FYMinHeap *heap = [[FYMinHeap alloc] initWith:[[self.edges allObjects] mutableCopy] comparator:block];
    
    //创建并查集
    FYGenericUnionFind *uf = [[FYGenericUnionFind alloc] init];
    
    //便利所有顶点 加入并查集
    for (id form in [self.vertices allKeys]) {
        
        FYVertex *vertex = [self.vertices objectForKey:form];
        
        [uf markSet:vertex];
    }
    
    while (![heap isEmpty] && edgeInfos.count < edgeSize) {
        
        //获取到当前堆的顶点  最小权值的边
        FYEdge *edge = (FYEdge *)[heap remove];
        
        //如果 该边的发出顶点和到达顶点在同一个并查集里 则跳过此循环（在同一个集合的话形成环了）
        if ([uf isSame:edge.fromVertex and:edge.toVertex]) continue;
        
        [edgeInfos addObject:edge.weight];
        [uf unionValue:edge.fromVertex and:edge.toVertex];
    }
    
    return edgeInfos;
}

#pragma mark - 获取begin起始到图中所有点的最短路径
/// 开始顶点的出度 加入临时字典  便利临时字典 依次找到最小权值边 进行松弛
/// 松弛操作：对minVertex 的 outEdges 进行松弛操作 有最优路径这更新 无则开启下次循环
- (NSMutableDictionary *)shortestPath:(id)begin comparator:(comparatorBlock)block {
    
    FYVertex *beginVertex = [self.vertices objectForKey:begin];
    if (beginVertex == nil) return nil;
    
    //存放开始顶点到各顶点的最短路径
    NSMutableDictionary *selectPaths = [NSMutableDictionary dictionary];
    
    //临时字典储存当前查到的边的到达顶点和权重
    NSMutableDictionary *paths = [NSMutableDictionary dictionary];
    
    //除法顶点 出去的边的到达顶点 和 权重 放入此字典
    for (FYEdge *edge in beginVertex.outEdge) {
        
        FYPathInfo *path = [[FYPathInfo alloc] init];
        path.weight = edge.weight;
        [path.edgeInfos addObject:edge];
        
        [paths setObject:path forKey:edge.toVertex];
    }

    // 临时字典为空时 退出循环
    while (!([[paths allValues] count] == 0)) {
        
        //获取当前字典里存的到达顶点的最短路径
        NSMutableDictionary *minEntry = [self getMinPath:paths comparator:block];

        //获取最短路径的到达顶点
        NSArray *minEntryAllKey = [minEntry allKeys];
        FYVertex *minVertex = minEntryAllKey[0];
        
        //到达顶点为value 到达顶点的边的权重之和为value 放入返回字典中
        FYPathInfo *minPaht = [minEntry objectForKey:minVertex];
        [selectPaths setObject:minPaht forKey:minVertex.value];
        
        //删除临时字典paths中的minVertex
        [paths removeObjectForKey:minVertex];

        //对minVertex 的 outEdges 进行松弛操作
        for (FYEdge *edge in minVertex.outEdge) {
            
            // 如果edge.to已经离开桌面，就没必要进行松弛操作
            if ([[selectPaths allValues] containsObject:edge.toVertex.value]) continue;
            
            [self relaxPaths:paths edge:edge fromPath:minPaht comparator:block];
        }
    }
    
    [selectPaths removeObjectForKey:begin];
    
    return selectPaths;
}

#pragma mark - 松弛操作
/// 对某个边进行松弛操作
/// @param paths 临时字典paths
/// @param edge 松弛的边
/// @param fromPath 当前顶点最小权重
/// @param block 比较器
- (void)relaxPaths:(NSMutableDictionary *)paths edge:(FYEdge *)edge fromPath:(FYPathInfo *)fromPath comparator:(comparatorBlock)block {
    
    // 新的可选择的最短路径：beginVertex到edge.from的最短路径 + edge.weight
    id newWeight = [NSString stringWithFormat:@"%.0f",[fromPath.weight doubleValue]  + [edge.weight doubleValue]];
    
    // 以前的最短路径：beginVertex到edge.to的最短路径
    FYPathInfo *oldPath = [paths objectForKey:edge.toVertex];
    
    if (oldPath != nil && block(newWeight, oldPath.weight) >= 0) return;
    
    if (oldPath == nil) {
        
        oldPath = [[FYPathInfo alloc] init];
        
        [paths setObject:oldPath forKey:edge.toVertex];
    }else {
        
        [oldPath.edgeInfos removeAllObjects];
    }
    
    oldPath.weight = newWeight;
    [oldPath.edgeInfos addObjectsFromArray:[fromPath.edgeInfos allObjects]];
    [oldPath.edgeInfos addObject:edge];
    
}

#pragma mark -  从paths中挑一个最小的路径出来
/// @param block 比较器
- (NSMutableDictionary *)getMinPath:(NSMutableDictionary *)paths comparator:(comparatorBlock)block {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray *arr = [paths allKeys];
    
    //只有一个元素直接返回
    if (arr.count == 1) {

        [dic setDictionary:paths];
        
        return dic;
    }
    
    for (int a = 0; a < arr.count - 1; a++) {
        
        FYVertex *vertex1 = arr[a];
        FYPathInfo *path1 = [paths objectForKey:vertex1];

        //第一轮不比较
        if (a == 0) {
            [dic setObject:path1 forKey:vertex1];
            continue;
        }
        
        FYVertex *vertex2 = [dic allKeys][0];
        FYPathInfo *path2 = [dic objectForKey:vertex2];
        
        if (block(path1.weight, path2.weight) < 0) {
            
            [dic removeAllObjects];
            [dic setObject:path1 forKey:vertex1];
        }
    }
    
    return dic;
}

@end
