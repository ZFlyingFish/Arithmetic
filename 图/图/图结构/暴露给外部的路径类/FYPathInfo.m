//
//  FYPathInfo.m
//  图
//
//  Created by 毛 on 2020/12/29.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYPathInfo.h"

@implementation FYPathInfo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgeInfos = [NSMutableSet set];
    }
    return self;
}

@end
