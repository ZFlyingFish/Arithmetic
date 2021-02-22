//
//  FYShellSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/14.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYShellSort.h"
#import <math.h>

@implementation FYShellSort


- (void)sort {

    NSMutableArray *stepSequence = [self sedgewickStepSequence];
    
    for (NSInteger i = 0; i < stepSequence.count; i++) {
        
        int step = [stepSequence[i] intValue];
                
        [self sort1:step];
    }
}

//根据步长序列排序  根据分成step列 进行排序
- (void)sort1:(int)step {
    
    //col:第几列 column的简称
    for (int col = 0; col < step; col++) {
        
        for (int begin = step + col; begin < self.array.count; begin += step) {
        
            int cur = begin;
            
            while (cur > col && ([self cmp:cur to:cur - step] < 0)) {
                
                [self swapIndex:cur to:cur-step];
                cur -= step;
            }
        }
    }
}

//获取步长序列
- (NSMutableArray *)sedgewickStepSequence {
    
    NSMutableArray *stepSequence = [NSMutableArray array];
    
    int k = 0, step = 0;
    
    while (true) {
        
        if (k % 2 == 0) {
            
            int pow = (int) powl(2, k >> 1);
            
            
            step = 1 + 9 * (pow * pow - pow);
            
        } else {
            
            int pow1 = (int) powl(2, (k - 1) >> 1);
            
            int pow2 = (int) powl(2, (k + 1) >> 1);
            
            step = 1 + 8 * pow1 * pow2 - 6 * pow2;
        }
        
        if (step >= self.array.count) break;
        
        [stepSequence insertObject:@(step) atIndex:0];
        
        k++;
    }
    
    return stepSequence;
    
}
 
@end
