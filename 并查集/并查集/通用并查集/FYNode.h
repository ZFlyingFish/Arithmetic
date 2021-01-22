//
//  FYNode.h
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYNode : NSObject

- (instancetype)initWith:(id)value;

@property (nonatomic, strong) id value;

@property (nonatomic, strong) FYNode *parent;

@property (nonatomic, assign) int rank;

@end

NS_ASSUME_NONNULL_END
