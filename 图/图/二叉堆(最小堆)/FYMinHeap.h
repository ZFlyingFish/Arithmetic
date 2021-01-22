//
//  FYMinHeap.h
//  图
//
//  Created by 毛 on 2020/12/24.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//


//最小堆  这是一个最小堆


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int(^comparatorBlock)(id weight1,id weight2);


@interface FYMinHeap : NSObject

- (instancetype)initWith:(NSMutableArray *)elements comparator:(comparatorBlock)block;

- (NSInteger)getSize;
- (BOOL)isEmpty;
- (void)addAll:(NSMutableArray *)arr;
- (void)add:(id)element;
- (id)remove;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
