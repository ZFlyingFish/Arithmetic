//
//  FYEdge.h
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYVertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface FYEdge : NSObject<NSCopying>

/// 边从哪个顶点来
@property (nonatomic, strong) FYVertex *fromVertex;

/// 边到哪个顶点去
@property (nonatomic, strong) FYVertex *toVertex;

/// 此边的权重
@property (nonatomic, strong) id weight;

- (instancetype)initWithFrom:(FYVertex *)from to:(FYVertex *)to;

@end

NS_ASSUME_NONNULL_END
