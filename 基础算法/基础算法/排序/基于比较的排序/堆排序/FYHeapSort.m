//
//  FYHeapSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYHeapSort.h"

@interface FYHeapSort ()

@property (nonatomic, assign) int heapSize;

@end

@implementation FYHeapSort


- (void)sort {

    self.heapSize = (int)self.array.count;
    
    // 原地建堆  （最大堆）
    for (int i = (self.heapSize >> 1) - 1; i >= 0; --i) {
        
        //所有的非叶子节点依次下虑 最大堆就排好了
        [self siftDown:i];
    }
    
    //交换堆顶元素和尾元素 （交换一次微元素位置 --1）
    //尾元素位置 == 1 时数组有序了
    while(self.heapSize > 1) {
        
        [self swapIndex:0 to:--self.heapSize];
        
        [self siftDown:0];
    }
    
}

- (void)siftDown:(int)index {
    
    int element = [self.array[index] intValue];
    
    int childIndex;
    
    //self.heapSize >> 1  最后一个非叶子节点的 index
    //index 每次传入的是最后一个飞叶子节点-1
    //half 最后一个非叶子节点的 index
    //index < half ; index = childIndex
    //这个index < half
    //因为 index = childIndex  childIndex 必然大于 index
    //第一次循环index = half 然后每次循环都是 index > half 所以在等待循环里的break;  break 时 下虑到了叶子节点

    for(int half = self.heapSize >> 1; index < half; index = childIndex) {
             
        //左子节点的 index
        childIndex = (index << 1) + 1;
           
        //左子节点的 index位置的值
        int child = [self.array[childIndex] intValue];
            
        //右子节点的 index
        int rightIndex = childIndex + 1;
               
        //rightIndex < self.heapSize  节点的index 必须小于数组的size
        //[self cmpElement:[self.array[rightIndex] intValue] to:child]
        //右子节点的值 大于 左子节点的值
        if (rightIndex < self.heapSize && [self cmpElement:[self.array[rightIndex] intValue] to:child] > 0) {
              
            // 记录 左右子节点 比较大的值 和 index
            childIndex = rightIndex;
                   
            child = [self.array[rightIndex] intValue];
               
        }//这里没有else  是因为 childIndex  child 已经记录了 左子节点的index 和 值了
        
               
        // 如果 父节点的值 大于 最大子子节点的值 则不需下虑 退出此次循环
        if ([self cmpElement:element to:child] >= 0) {
                  
            break;
        }

        //如果 父节点的值 小于于 最大子子节点的值 则需下虑  继续循环下去
        self.array[index] = @(child);
    }
    
    self.array[index] = @(element);
}



@end
