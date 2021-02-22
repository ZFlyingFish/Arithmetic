//
//  FYBubbleSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYBubbleSort.h"

@implementation FYBubbleSort

- (void)sort {

    for (NSInteger end = self.array.count - 1; end > 0; end--) {
        
        for (NSInteger i = 1; i < end; i++) {
            
            if ([self cmp:i-1 to:i] > 0) {
                
                [self swapIndex:i to:i-1];
            }
        }
    }
}


@end
