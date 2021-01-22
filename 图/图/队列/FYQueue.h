//
//  FYQueue.h
//  图
//
//  Created by 毛 on 2020/12/23.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYQueue : NSObject

/// 队列添加元素
/// @param obj 元素
- (void)addObject:(id)obj;

/// 返回队头元素并删除队列内元素
- (id)removeObject;

/// 返回队头元素 不删除队列内元素
- (id)firstObject;

/// 队列是否为空
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
