//
//  FYSort.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYSort.h"



@implementation FYSort

- (void)sort:(NSMutableArray *)arr {
    
    self.array = arr;
    
    NSString *s = [self getNowTimeTimestamp3];

    [self sort];
    
    NSString *s1 = [self getNowTimeTimestamp3];

    self.time = [s1 doubleValue] - [s doubleValue];
    
    NSString *success;
    
    if ([self sortSuccess:self.array]) {
        
        success = @"成功";
    }else {
        
        success = @"失败";
    }
    
    NSLog(@"\n %@ \n 用时:%.f毫秒\t 排序%@\t 比较次数:%d\t 交换次数:%d \n\n",[self class],self.time,success,self.cmpCount,self.swapCount);
    
//    NSLog(@"%@",self.array);
}

- (void)sort {
    
    
}

- (int)cmp:(NSInteger)a to:(NSInteger)b {
    
    self.cmpCount++;

    return [self.array[a] intValue] - [self.array[b] intValue];
   
}

- (int)cmpElement:(int)a to:(int)b {
    
    self.cmpCount++;
    
    return a - b;
}

- (void)swapIndex:(NSInteger)a to:(NSInteger)b {
    
    self.swapCount++;
    
    [self.array exchangeObjectAtIndex:a withObjectAtIndex:b];
}

#pragma mark - 排序成功返回yes  失败返回no
- (BOOL)sortSuccess:(NSMutableArray *)arr {
    
    BOOL isBool = YES;
    
    for (int i = 1; i < arr.count; i++) {
     
        if ([arr[i] intValue] < [arr[i-1] intValue]) {
            
            isBool = NO;
        }
    }
    
    return isBool;
    
}

#pragma mark - 获取当前时间
- (NSString *)getNowTimeTimestamp3{
    
    double currentTime =  [[NSDate date] timeIntervalSince1970]*1000;

    NSString *strTime = [NSString stringWithFormat:@"%.0f",currentTime];

    return strTime;
}


@end
