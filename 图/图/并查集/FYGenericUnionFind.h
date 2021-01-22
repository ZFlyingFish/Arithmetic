//
//  FYGenericUnionFind.h
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface FYGenericUnionFind : NSObject

- (void)markSet:(id)value;

- (FYNode *)fandNode:(id)value;

- (id)find:(id)value;

- (void)unionValue:(id)value1 and:(id)value2;

- (BOOL)isSame:(id)value1 and:(id)value2;

@end

NS_ASSUME_NONNULL_END
