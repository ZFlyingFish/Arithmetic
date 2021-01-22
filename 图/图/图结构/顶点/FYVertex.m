//
//  FYVertex.m
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYVertex.h"

@implementation FYVertex

- (instancetype)initWith:(id)value {
    
    self = [super init];
    if (self) {
        self.value = value;
        self.inEdge = [NSMutableSet set];
        self.outEdge = [NSMutableSet set];
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    return self;
}

- (NSUInteger)hash {
    
    return self.value == nil ? 0 : [self.value hash];
}

- (BOOL)isEqual:(id)object {
    
    FYVertex *a = (FYVertex *)object;
    
    if ([self.value isEqual:a.value]) return YES;
    
    return NO;
}

@end
