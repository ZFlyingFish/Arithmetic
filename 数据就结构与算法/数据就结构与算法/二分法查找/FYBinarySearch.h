//
//  FYBinarySearch.h
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/9.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYBinarySearch : NSObject



/// 查找元素在数组中的位置
/// @param arr 查找的数组
/// @param value   查找的元素
- (NSInteger)indexOf:(NSMutableArray *)arr search:(int)value;

/// 查找数组中第一个比该元素大的位置
/// @param arr 查找的数组
/// @param value 查找的元素
- (NSInteger)indexOf1:(NSMutableArray *)arr search:(int)value;

@end

NS_ASSUME_NONNULL_END
