//
//  FYPathInfo.h
//  图
//
//  Created by 毛 on 2020/12/29.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPathInfo : NSObject

@property (nonatomic, strong) NSMutableSet *edgeInfos;
@property (nonatomic, strong) id weight;

@end

NS_ASSUME_NONNULL_END
