//
//  FYSort.h
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/4.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYSort : NSObject

///排序的数组
@property (nonatomic, strong) NSMutableArray *array;

/// 排序时间
@property (nonatomic, assign) double time;

/// 比较次数
@property (nonatomic, assign) int cmpCount;

/// 交换次数
@property (nonatomic, assign) int swapCount;

- (void)sort:(NSMutableArray *)arr;

- (void)sort;

- (int)cmp:(NSInteger)a to:(NSInteger)b;

- (int)cmpElement:(int)a to:(int)b;

- (void)swapIndex:(NSInteger)a to:(NSInteger)b;

@end

NS_ASSUME_NONNULL_END
