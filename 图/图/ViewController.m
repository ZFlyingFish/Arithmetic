//
//  ViewController.m
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "ViewController.h"
#import "FYListGraph.h"
#import "FYQueue.h"
#import "FYMinHeap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FYListGraph *listGraph = [[FYListGraph alloc] init];
    
    [listGraph addEdge:@"3" to:@"10" weight:@"12"];
    [listGraph addEdge:@"3" to:@"8" weight:@"11"];
    [listGraph addEdge:@"8" to:@"12" weight:@"3"];
    [listGraph addEdge:@"8" to:@"6" weight:@"5"];
    [listGraph addEdge:@"8" to:@"9" weight:@"9"];
    [listGraph addEdge:@"6" to:@"11" weight:@"8"];
    [listGraph addEdge:@"10" to:@"9" weight:@"1"];
    [listGraph addEdge:@"9" to:@"11" weight:@"2"];
    
    // 广度优先搜索
    NSMutableArray *arr1 = [NSMutableArray array];
    
    [listGraph bfs:@"3" visitor:^BOOL(id  _Nonnull value) {
        
        [arr1 addObject:value];
        return YES;
    } ];
    
    NSLog(@"广度优先搜索:%@",arr1);
    
    //深度优先搜索
    NSMutableArray *arr2 = [NSMutableArray array];

    [listGraph dfs:@"3" visitor:^BOOL(id  _Nonnull value) {
        
        [arr2 addObject:value];
        return YES;
    } ];
    NSLog(@"深度优先搜索:%@",arr2);

    
    //拓扑排序
    NSMutableArray *arr = [listGraph topologicalSort];
    NSLog(@"拓扑排序:%@",arr);
    
    
    //最小生成树需要双向图所以添加一下边
    [listGraph addEdge:@"10" to:@"3" weight:@"12"];
    [listGraph addEdge:@"8" to:@"3" weight:@"11"];
    [listGraph addEdge:@"12" to:@"8" weight:@"3"];
    [listGraph addEdge:@"6" to:@"8" weight:@"5"];
    [listGraph addEdge:@"9" to:@"8" weight:@"9"];
    [listGraph addEdge:@"11" to:@"6" weight:@"8"];
    [listGraph addEdge:@"9" to:@"10" weight:@"1"];
    [listGraph addEdge:@"11" to:@"9" weight:@"2"];

    
    //最小生成树
    NSMutableSet *set = [listGraph prim:^int(id  _Nonnull weight1, id  _Nonnull weight2) {

        FYEdge *edge1 = (FYEdge *)weight1;
        FYEdge *edge2 = (FYEdge *)weight2;

        return [edge1.weight intValue] - [edge2.weight intValue];
       
    }];
    
    NSLog(@"prim最小生成树:%@",set);
    
    
    //最小生成树
    NSMutableSet *set1 = [listGraph kruskal:^int(id  _Nonnull weight1, id  _Nonnull weight2) {

        FYEdge *edge1 = (FYEdge *)weight1;
        FYEdge *edge2 = (FYEdge *)weight2;

        return [edge1.weight intValue] - [edge2.weight intValue];
       
    }];
    
    NSLog(@"kruskal最小生成树%@",set1);
    
    [self testShortestPath];
    
    
    NSInteger a = NSIntegerMax;
    
}

//测试最小堆
- (void)testHeap {
    
    FYMinHeap *minHeap = [[FYMinHeap alloc] initWith:[NSMutableArray array] comparator:^int(id  _Nonnull edgeWeight1, id  _Nonnull edgeWeight2) {

        return [edgeWeight1 intValue] - [edgeWeight2 intValue];
    }];


    [minHeap add:@"4"];
    [minHeap add:@"3"];
    [minHeap add:@"8"];
    [minHeap add:@"1"];
    [minHeap add:@"10"];
    [minHeap add:@"11"];
    
    NSLog(@"%@",minHeap);
}

//
- (void)testShortestPath {
    
    
    FYListGraph *listGraph = [[FYListGraph alloc] init];
     
     [listGraph addEdge:@"A" to:@"B" weight:@"10"];
     [listGraph addEdge:@"A" to:@"D" weight:@"30"];
     [listGraph addEdge:@"A" to:@"E" weight:@"100"];
     [listGraph addEdge:@"B" to:@"C" weight:@"50"];
     [listGraph addEdge:@"C" to:@"E" weight:@"10"];
     [listGraph addEdge:@"D" to:@"C" weight:@"20"];
     [listGraph addEdge:@"D" to:@"E" weight:@"60"];

    NSMutableDictionary *dic = [listGraph shortestPath:@"A" comparator:^int(id  _Nonnull weight1, id  _Nonnull weight2) {
        
        return [weight1 doubleValue] - [weight2 doubleValue];
    }];
    
//    NSLog(@"%@",dic);
    
    for (id a in dic) {
        
        FYPathInfo *info = dic[a];
        
        NSLog(@"-------------------");
        NSLog(@"A到达顶点：%@ -最小权重为： %@ ",a,info.weight);
        
        for (FYEdge *edge in info.edgeInfos) {
            
            NSLog(@"%@ 到顶点：%@ 权重：%@",edge.fromVertex.value,edge.toVertex.value,edge.weight);
            
        }
        NSLog(@"+++++++++++++++");

        
    }
    
    
}


@end
