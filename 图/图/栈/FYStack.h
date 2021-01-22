//
//  FYStack.h
//  图
//
//  Created by 毛 on 2020/12/23.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYStack : NSObject

/// 入栈
/// @param obj 元素
- (void)pushObject:(id)obj;

/// 栈顶元素出栈并返回
- (id)popObject;

/// 返回栈顶元素 不删除栈内元素
- (id)topObject;

/// 栈是否为空
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
