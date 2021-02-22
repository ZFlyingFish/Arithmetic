//
//  FYMergeSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/11.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYMergeSort.h"

@interface FYMergeSort ()

@property (nonatomic, strong) NSMutableArray *leftArr;

@end

@implementation FYMergeSort

- (void)sort {

    self.leftArr = [NSMutableArray array];
    
    [self sortBegin:0 end:self.array.count];
}


- (void)sortBegin:(NSInteger)begin end:(NSInteger)end {
    
    if (end - begin >= 2) {
        
        NSInteger mid = (begin + end) >> 1;
        // 不断地将当前序列平均分割成2个子序列
        // 知道不能再分割（序列里只剩一个元素）
        [self sortBegin:begin end:mid];
        [self sortBegin:mid end:end];
        // 不断地将两个子序列合并成一个有序的序列
        // 最终只剩一个有序序列
        [self mergeBegin:begin mid:mid end:end];
    }
}

- (void)mergeBegin:(NSInteger)begin mid:(NSInteger)mid end:(NSInteger)end {
    
    NSInteger li = 0;              //归并的两个数组的第一个数组的左边 index
    NSInteger le = mid - begin;    //归并的两个数组的第一个数组的右边 index
    NSInteger ri = mid;            //归并的两个数组的第二个数组的左边 index
    NSInteger re = end;            //归并的两个数组的第二个数组的右边 index
    NSInteger ai = begin;          //归并的两个数组覆盖到那个位置了
    
    //备份左边数组的元素
    for(NSInteger i = li; i < le; ++i) {
        
        self.leftArr[i] = self.array[begin + i];
    }
    
    while(true) {
        
        while(li < le) {
            
            if (ri < re && [self cmpElement:[self.array[ri] intValue] to:[self.leftArr[li] intValue]] < 0) {
                
                self.array[ai++] = self.array[ri++];
                
            } else {
                
                self.array[ai++] = self.leftArr[li++];
            }
        }

        return;
    }
}


@end
