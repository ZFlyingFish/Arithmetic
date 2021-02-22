//
//  FYRandomNumber.h
//  数据就结构与算法
//
//  Created by 毛 on 2020/12/3.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYRandomNumber : NSObject

/// 获取随机数数组
/// @param num 数组数量
/// @param max 数组内随机数最大值
/// @param min 数组内随机数最小值
+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min;

/// 获取随机数数组
/// @param num 数组数量
/// @param max 数组内随机数最大值
/// @param min 数组内随机数最小值
/// @param tailNum 最后多少位是相同的
+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min tail:(NSInteger)tailNum;

@end

NS_ASSUME_NONNULL_END
