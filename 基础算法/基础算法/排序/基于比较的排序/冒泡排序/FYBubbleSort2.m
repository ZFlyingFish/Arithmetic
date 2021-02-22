//
//  FYBubbleSort2.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYBubbleSort2.h"

@implementation FYBubbleSort2

- (void)sort {

    for (NSInteger end = self.array.count - 1; end > 0; end--) {
        
        //初始值等于1 防止数组未排序前就是有序数组  （第二个循环一次未修改 第一个循环直接退出）
        NSInteger isNum = 1;
        for (NSInteger i = 1; i <= end; i++) {
            
            if ([self cmp:i-1 to:i] > 0) {
                
                [self swapIndex:i to:i-1];
                
                isNum = i;
            }
        }
        
        end = isNum;
    }
}

@end
