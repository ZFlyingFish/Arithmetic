//
//  FYQuickSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/11.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYQuickSort.h"

@implementation FYQuickSort


- (void)sort {

    [self sortBegin:0 end:self.array.count];
}

//对 [begin, end) 范围的元素进行快速排序
- (void)sortBegin:(NSInteger)begin end:(NSInteger)end {
    
    if (end - begin < 2) return;

    // 确定轴点位置 O(n)
    NSInteger mid = [self pivotIndexBegin:begin end:end];
    
    // 对子序列进行快速排序
    [self sortBegin:begin end:mid];
    [self sortBegin:mid+1 end:end];
}


/// 构造出 [begin, end) 范围的轴点元素  返回轴点元素的最终位置
- (NSInteger)pivotIndexBegin:(NSInteger)begin end:(NSInteger)end {
    
    NSInteger a = begin + (NSInteger)(arc4random() % (end - begin));
    
    // 随机选择一个元素跟begin位置进行交换
    [self swapIndex:begin to:a];
    
    // 备份begin位置的元素
    int pivot = [self.array[begin] intValue];
    // end指向最后一个元素
    end--;
    
    while (begin < end) {
        while (begin < end) {

            if ([self cmpElement:pivot to:[self.array[end] intValue]] < 0) { // 右边元素 > 轴点元素
                end--;
            } else { // 右边元素 <= 轴点元素
                self.array[begin++] = self.array[end];
                break;
            }
        }
        while (begin < end) {
            
            if ([self cmpElement:pivot to:[self.array[begin] intValue]] > 0) { // 左边元素 < 轴点元素
                begin++;
            } else { // 左边元素 >= 轴点元素
                self.array[end--] = self.array[begin];
                break;
            }
        }
    }
    
    // 将轴点元素放入最终的位置
    self.array[begin] = @(pivot);
    // 返回轴点元素的位置
    return begin;
}

@end
