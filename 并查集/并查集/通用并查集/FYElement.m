//
//  FYElement.m
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "FYElement.h"

@implementation FYElement


- (instancetype)initWithAge:(NSInteger)age andName:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        
        self.age = age;
        self.name = name;
    }
    
    return self;
}


- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    return self;
}

- (NSUInteger)hash {
    
    return  [self.name hash] * 31 + self.age;
}

- (BOOL)isEqual:(id)object {
    
    FYElement *a = (FYElement *)object;
    
    if ([self.name isEqual:a.name] && self.age == a.age) return YES;
    
    return NO;
}

@end
