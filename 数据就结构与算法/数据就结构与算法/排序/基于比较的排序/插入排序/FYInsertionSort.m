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
        
        int a = begin;
        int b = [self.array[a] intValue];
                
        while (a > 0 && [self cmpElement:b to:[self.array[a - 1] intValue]] < 0) {

            self.array[a] = self.array[a-1];
            
            a--;
        }
        
        self.array[a] = @(b);
    }
}


@end
