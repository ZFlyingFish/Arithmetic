//
//  ViewController.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/11/30.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "ViewController.h"
#import "FYRandomNumber.h"
#import "FYSort.h"
#import "FYBubbleSort.h"
#import "FYBubbleSort1.h"
#import "FYBubbleSort2.h"
#import "FYSelectionSort.h"
#import "FYHeapSort.h"
#import "FYInsertionSort.h"
#import "FYBinarySearch.h"
#import "FYMergeSort.h"
#import "FYQuickSort.h"
#import "FYShellSort.h"
#import "FYCountingSort.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSMutableArray *arr = [FYRandomNumber randomNumber:10 max:30 min:10];
    
    
    NSMutableArray *arr = [FYRandomNumber randomNumber:10000 max:20000 min:30 tail:500];

    //冒泡排序
    FYSort *bubbleSort = [[FYBubbleSort alloc] init];
    [bubbleSort sort:[arr mutableCopy]];

    //冒泡排序 优化一  如果数组在某一次循环提前有序了 则直接终止排序
    FYSort *bubbleSort1 = [[FYBubbleSort1 alloc] init];
    [bubbleSort1 sort:[arr mutableCopy]];

    //冒泡排序 优化二 在排序时 后面某段提前有序了 此段不在排序
    FYSort *bubbleSort2 = [[FYBubbleSort2 alloc] init];
    [bubbleSort2 sort:[arr mutableCopy]];

    // 冒泡排序 平均时间复杂度 O(n * n)
    // 冒泡排序 平均空间复杂度 O(0)


    //选择排序  每扫描一遍 记录最大值 与最后位置交换
    FYSort *selectSort = [[FYSelectionSort alloc] init];
    [selectSort sort:[arr mutableCopy]];

    // 选择排序 平均时间复杂度 O(n * n)
    // 选择排序 平均空间复杂度 O(0)

    // 堆排序
    FYSort *heapSort = [[FYHeapSort alloc] init];
    [heapSort sort:[arr mutableCopy]];

    // 堆排序 平均时间复杂度 O(n log n)
    // 堆排序 平均空间复杂度 O(0)


    //插入排序排序 扫描一遍 每扫到一个值 就开始找这个值在前面那个位置插入
    FYSort *insertionSort = [[FYInsertionSort alloc] init];
    [insertionSort sort:[arr mutableCopy]];

    // 插入排序 平均时间复杂度 O(n * n) 可优化查找插入位置用二分法
    // 插入排序 平均空间复杂度 O(0)


    //二分法查找
    FYBinarySearch *binarySearch = [[FYBinarySearch alloc] init];
    NSMutableArray *binarySearchArr = [NSMutableArray array];
    [binarySearchArr addObject:@(1)];
    [binarySearchArr addObject:@(2)];
    [binarySearchArr addObject:@(2)];
    [binarySearchArr addObject:@(2)];
    [binarySearchArr addObject:@(4)];
    [binarySearchArr addObject:@(6)];
    [binarySearchArr addObject:@(5)];
    [binarySearchArr addObject:@(8)];
    [binarySearchArr addObject:@(10)];
    [binarySearchArr addObject:@(13)];
    [binarySearchArr addObject:@(15)];
    NSInteger a =  [binarySearch indexOf1:binarySearchArr search:3];

    NSLog(@"\n数组中第一个比该元素大的位置：%ld",a);



    // 归并排序 平均时间复杂度 O(n log n)
    // 归并排序 平均空间复杂度 O(n/2 + log n)  也就是 O（n）
    FYSort *mergeSort = [[FYMergeSort alloc] init];
    [mergeSort sort:[arr mutableCopy]];



    // 归并排序 平均时间复杂度 O(n log n)
    // 归并排序 平均空间复杂度 O(logn）
    // 不稳定排序
    FYSort *quickSort = [[FYQuickSort alloc] init];
    [quickSort sort:[arr mutableCopy]];



    // 归并排序 平均时间复杂度 O(n log n)
    // 归并排序 平均空间复杂度 O(logn）
    // 不稳定排序
    FYSort *shellSort = [[FYShellSort alloc] init];
    [shellSort sort:[arr mutableCopy]];
    
    // 计数排序 平均时间复杂度 O(n + k)
    // 计数排序 平均空间复杂度 O(n + k） n:元素数量  k:最小元素到最大元素之间的范围
    // 稳定排序
    FYSort *countingSort = [[FYCountingSort alloc] init];
    [countingSort sort:[arr mutableCopy]];
    
}





@end
