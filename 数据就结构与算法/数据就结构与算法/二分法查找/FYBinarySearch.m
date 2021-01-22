//
//  FYBinarySearch.m
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/9.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYBinarySearch.h"

@implementation FYBinarySearch

- (NSInteger)indexOf:(NSMutableArray *)arr search:(int)value {
    
    NSInteger begin = 0;
    NSInteger end = arr.count;
    
    while (begin < end) {
        
        NSInteger mid = (end + begin) >> 1;

        if (value < [arr[mid] intValue]) {
            
            end = mid;
            
        } else {
            
            if (value <= [arr[mid] intValue]) {
                
                return mid;
            }

            begin = mid + 1;
        }
    }
    
    return -1;
}



- (NSInteger)indexOf1:(NSMutableArray *)arr search:(int)value {
    
    
    //arr = @[@1,@2,@2,@2,@4];
    
    NSInteger begin = 0;
    NSInteger end = arr.count;
    
    while (begin < end) {
        
        NSInteger mid = (end + begin) >> 1;
        
        if (value < [arr[mid] intValue]) {

            end = mid;
            
        } else {
            
            begin = mid + 1;
        }
    }
    
    return begin;

}

@end
