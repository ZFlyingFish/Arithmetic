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

+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min;

+ (NSMutableArray *)randomNumber:(NSInteger)num max:(NSInteger)max min:(NSInteger)min tail:(NSInteger)tailNum;

@end

NS_ASSUME_NONNULL_END
