//
//  FYBubbleSort1.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYBubbleSort1.h"

@implementation FYBubbleSort1

- (void)sort {

    for (NSInteger end = self.array.count - 1; end > 0; end--) {
        
        //每轮比较时 都声明一个bool  如果有交换 则bool 为No  如果比较完还为yes则数组提前有序则退出最外层循环
        BOOL isBool = YES;
        for (NSInteger i = 1; i <= end; i++) {
            
            if ([self cmp:i-1 to:i] > 0) {
                
                [self swapIndex:i to:i-1];
                
                isBool = NO;
            }
        }
        
        if (isBool) {
            
            break;
        }
        
    }
}


@end
