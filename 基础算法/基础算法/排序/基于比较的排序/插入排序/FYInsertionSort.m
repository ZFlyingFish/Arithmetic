//
//  FYInsertionSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/7.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYInsertionSort.h"

@implementation FYInsertionSort

- (void)sort {
    
    for (int begin = 1; begin < self.array.count; begin++) {
        
        // 待插入元素的索引
        int a = begin;
        // 待插入元素
        int b = [self.array[a] intValue];
               
        // 判断插入位置 并把插入位置到待插入位置的元素往后挪移一位
        while (a > 0 && [self cmpElement:b to:[self.array[a - 1] intValue]] < 0) {

            self.array[a] = self.array[a-1];
            
            a--;
        }
        // 待插入元素放到最终的何时位置
        self.array[a] = @(b);
    }
}


@end
