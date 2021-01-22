//
//  FYEdge.m
//  图
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYEdge.h"

@implementation FYEdge

- (instancetype)initWithFrom:(FYVertex *)from to:(FYVertex *)to {
    
    self = [super init];
    if (self) {
        
        self.fromVertex = from;
        self.toVertex = to;
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    return self;
}

- (NSUInteger)hash {
    
    return [self.fromVertex hash] * 31 + [self.toVertex hash];
}

- (BOOL)isEqual:(id)object {
    
    FYEdge *a = (FYEdge *)object;
    
    if ([self.fromVertex isEqual:a.fromVertex] && [self.toVertex isEqual:a.toVertex]) return YES;
    
    return NO;
}



@end
