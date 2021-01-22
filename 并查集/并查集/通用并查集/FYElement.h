//
//  FYElement.h
//  并查集
//
//  Created by 毛 on 2020/12/21.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYElement : NSObject<NSCopying>

- (instancetype)initWithAge:(NSInteger)age andName:(NSString *)name;


@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
