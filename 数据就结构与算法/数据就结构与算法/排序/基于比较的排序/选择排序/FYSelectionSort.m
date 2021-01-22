//
//  FYSelectionSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYSelectionSort.h"

@implementation FYSelectionSort


- (void)sort {

    for (NSInteger end = self.array.count - 1; end > 0; end--) {
        
        NSInteger isNum = 0;
        
        for (NSInteger i = 1; i <= end; i++) {

            if ([self cmp:i to:isNum] > 0) {
                
                isNum = i;
            }
        }
        
        [self swapIndex:isNum to:end];
    }
}

@end
