//
//  FYVertex.h
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYVertex : NSObject<NSCopying>

/// 顶点存储的信息
@property (nonatomic, strong) id value;

/// 进来的边集合
@property (nonatomic, strong) NSMutableSet *inEdge;

/// 出去的边集合
@property (nonatomic, strong) NSMutableSet *outEdge;

- (instancetype)initWith:(id)value;

@end

NS_ASSUME_NONNULL_END
