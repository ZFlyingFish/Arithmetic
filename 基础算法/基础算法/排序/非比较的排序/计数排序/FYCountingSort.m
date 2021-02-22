//
//  FYCountingSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/14.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYCountingSort.h"

@implementation FYCountingSort

- (void)sort {
    
    [self sort2];
}

- (void)sort1 {
    
    //获取数组最大值
    int max = [self.array[0] intValue];
    
    for (NSInteger i = 0; i < self.array.count; i++) {
        
        if (max < [self.array[i] intValue]) {
            
            max = [self.array[i] intValue];
        }
    }
    
    //开辟新的存储空间  存储每个整数出现的次数
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:max+1];
    
    for (int i = 0; i <= max; i++) {
        [arr addObject:@(0)];
    }
    

    //把要排序的数组 里边的值与新数组的index相对应 value存的是value 出现的次数
    for (NSInteger a = 0; a < self.array.count; a++) {
                
        NSInteger index = [self.array[a] intValue];
        
        int indexValue = [arr[index] intValue];
        
        arr[index] = @(++indexValue);
    }
    
    //按顺序给原数组辅助 nexIndex 指向下一个要赋值的位置
    NSInteger nexIndex = 0;
    for (NSInteger b = 0; b < arr.count; b++) {
       
        int c = [arr[b] intValue];
        
        while (c-- > 0) {
                        
            self.array[nexIndex++] = @(b);
        }
    }
}


- (void)sort2 {
    
    //获取数组最大值
    int max = [self.array[0] intValue];
    
    int min = [self.array[0] intValue];

    
    for (NSInteger i = 0; i < self.array.count; i++) {
        
        if (max < [self.array[i] intValue]) {
            
            max = [self.array[i] intValue];
        }
        
        if (min > [self.array[i] intValue]) {
            
            min = [self.array[i] intValue];
        }
    }
    
    //开辟新的存储空间  存储每个整数出现的次数
    NSMutableArray *counts = [NSMutableArray arrayWithCapacity:max-min+1];
    
    for (int i = 0; i < max-min+1; i++) {
        [counts addObject:@(0)];
    }
    
    //把要排序的数组 里边的值与新数组的index相对应 value存的是value 出现的次数
    for (NSInteger a = 0; a < self.array.count; a++) {
                
        NSInteger index = [self.array[a] intValue];
        
        int indexValue = [counts[index-min] intValue];
        
        counts[index - min] = @(++indexValue);
    }
    
    //累加次数
    for (NSInteger i = 1; i < counts.count; i++) {
        
        NSInteger value = [counts[i] intValue];
        NSInteger value1 = [counts[i-1] intValue];

        counts[i] = @(value + value1);
    }
    
    //创建新的数组
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.array.count];
    
    for (int i = 0; i < self.array.count; i++) {
        [newArray addObject:@(0)];
    }
    
    //从后往前便利 或得最新排好序的数组
    for (NSInteger i = self.array.count - 1; i >= 0; i--) {
        
        NSInteger value = [self.array[i] intValue];
        
        NSInteger value1 = [counts[value - min] intValue];
        
        --value1;
        
        counts[value - min] = @(value1);

        newArray[value1] = self.array[i];
    }
    
    for (int i = 0; i < newArray.count; i++) {
                
        
        self.array[i] = newArray[i];
    }
}



@end
