//
//  ViewController.m
//  并查集
//
//  Created by 毛 on 2020/12/16.
//  Copyright © 2020 ZTServiceProject. All rights reserved.
//

#import "ViewController.h"
#import "FYUnionFind.h"
#import "FYUnionFind_QF.h"
#import "FYUnionFind_QU.h"
#import "FYUnionFind_QU_S.h"
#import "FYUnionFind_QU_R.h"
#import "FYUnionFind_QU_R_PC.h"
#import "FYUnionFind_QU_R_PH.h"
#import "FYUnionFind_QU_R_PS.h"
#import "FYGenericUnionFind.h"
#import "FYElement.h"


@interface ViewController ()

@property (nonatomic, assign) int count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.purpleColor;

    self.count = 1000;
    
    FYUnionFind *unionFind_qf = [[FYUnionFind_QF alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu = [[FYUnionFind_QU alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu_s = [[FYUnionFind_QU_S alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu_r = [[FYUnionFind_QU_R alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu_r_pc = [[FYUnionFind_QU_R_PC alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu_r_ph = [[FYUnionFind_QU_R_PH alloc] initWithNum:self.count];
    FYUnionFind *unionFind_qu_r_ps = [[FYUnionFind_QU_R_PS alloc] initWithNum:self.count];


    [self test:unionFind_qf];
    [self test:unionFind_qu];
    [self test:unionFind_qu_s];
    [self test:unionFind_qu_r];
    [self test:unionFind_qu_r_pc];
    [self test:unionFind_qu_r_ph];
    [self test:unionFind_qu_r_ps];
    
    [self test1];
    [self test2];

}

#pragma mark - 基本数据类型的 并查集
- (void)test:(FYUnionFind *)unionFind {
    
    [unionFind unionData:1 and:2];
    [unionFind unionData:2 and:3];
    [unionFind unionData:7 and:8];
    [unionFind unionData:8 and:9];
    [unionFind unionData:1 and:7];
 
    NSLog(@"%d-%d-%d-%d", [unionFind isSame:1 and:3],
                          [unionFind isSame:3 and:4],
                          [unionFind isSame:7 and:9],
                          [unionFind isSame:1 and:9]);
    
    
    NSString *s = [self getNowTimeTimestamp3];
    
    for (int i = 0; i < self.count; i++) {
        
        [unionFind unionData:(int)(arc4random() % self.count) and:(int)(arc4random() % self.count)];
    }
    
    for (int i = 0; i < self.count; i++) {
        
        [unionFind isSame:(int)(arc4random() % self.count) and:(int)(arc4random() % self.count)];
    }
    
    NSString *s1 = [self getNowTimeTimestamp3];
    
    
    double time = [s1 doubleValue] - [s doubleValue];
    
    NSLog(@"用时：%.f",time);
    

}

#pragma mark - 储存NSString类型的 通用并查集
- (void)test1 {
    
    
    //通用并查集 不能使用基本数据类型  因为元素要作为key储存节点  
    FYGenericUnionFind *genericUnionFind = [[FYGenericUnionFind alloc] init];
    
    [genericUnionFind markSet:@"1"];
    [genericUnionFind markSet:@"2"];
    [genericUnionFind markSet:@"3"];
    [genericUnionFind markSet:@"4"];
    [genericUnionFind markSet:@"5"];
    [genericUnionFind markSet:@"6"];
    [genericUnionFind markSet:@"7"];
    [genericUnionFind markSet:@"8"];
    [genericUnionFind markSet:@"9"];
    
    [genericUnionFind unionValue:@"1" and:@"2"];
    [genericUnionFind unionValue:@"1" and:@"3"];
    [genericUnionFind unionValue:@"4" and:@"3"];
    [genericUnionFind unionValue:@"3" and:@"5"];
    
    [genericUnionFind unionValue:@"6" and:@"7"];
    [genericUnionFind unionValue:@"6" and:@"8"];
    [genericUnionFind unionValue:@"8" and:@"9"];
    
    NSLog(@"%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d",[genericUnionFind isSame:@"2" and:@"3"],
          [genericUnionFind isSame:@"1" and:@"3"],
          [genericUnionFind isSame:@"1" and:@"2"],
          [genericUnionFind isSame:@"4" and:@"3"],
          [genericUnionFind isSame:@"5" and:@"3"],
          [genericUnionFind isSame:@"5" and:@"4"],
          [genericUnionFind isSame:@"1" and:@"5"],
          [genericUnionFind isSame:@"2" and:@"5"],
          [genericUnionFind isSame:@"1" and:@"4"],
          [genericUnionFind isSame:@"6" and:@"8"],
          [genericUnionFind isSame:@"6" and:@"9"],
          [genericUnionFind isSame:@"7" and:@"8"]
    );
    
    NSLog(@"--------------------");
    
    NSLog(@"%d-%d-%d-%d-%d-%d-%d-%d-%d-%d",[genericUnionFind isSame:@"1" and:@"8"],
          [genericUnionFind isSame:@"2" and:@"8"],
          [genericUnionFind isSame:@"3" and:@"8"],
          [genericUnionFind isSame:@"4" and:@"8"],
          [genericUnionFind isSame:@"5" and:@"8"],
          [genericUnionFind isSame:@"1" and:@"6"],
          [genericUnionFind isSame:@"2" and:@"6"],
          [genericUnionFind isSame:@"3" and:@"6"],
          [genericUnionFind isSame:@"4" and:@"6"],
          [genericUnionFind isSame:@"5" and:@"6"]);
}

#pragma mark - 储存对象的 通用并查集
- (void)test2 {
    
    //通用并查集 不能使用基本数据类型  因为元素要作为key储存节点
    FYGenericUnionFind *genericUnionFind = [[FYGenericUnionFind alloc] init];
    
    FYElement *element1 = [[FYElement alloc] initWithAge:1 andName:@"1"];
    FYElement *element2 = [[FYElement alloc] initWithAge:2 andName:@"2"];
    FYElement *element3 = [[FYElement alloc] initWithAge:3 andName:@"3"];
    FYElement *element4 = [[FYElement alloc] initWithAge:4 andName:@"4"];
    FYElement *element5 = [[FYElement alloc] initWithAge:5 andName:@"5"];
    FYElement *element6 = [[FYElement alloc] initWithAge:6 andName:@"6"];
    FYElement *element7 = [[FYElement alloc] initWithAge:7 andName:@"7"];
    FYElement *element8 = [[FYElement alloc] initWithAge:8 andName:@"8"];
    FYElement *element9 = [[FYElement alloc] initWithAge:9 andName:@"9"];

    [genericUnionFind markSet:element1];
    [genericUnionFind markSet:element2];
    [genericUnionFind markSet:element3];
    [genericUnionFind markSet:element4];
    [genericUnionFind markSet:element5];
    [genericUnionFind markSet:element6];
    [genericUnionFind markSet:element7];
    [genericUnionFind markSet:element8];
    [genericUnionFind markSet:element9];
    
    [genericUnionFind unionValue:element1 and:element2];
    [genericUnionFind unionValue:element1 and:element3];
    [genericUnionFind unionValue:element4 and:element3];
    [genericUnionFind unionValue:element3 and:element5];
    
    [genericUnionFind unionValue:element6 and:element7];
    [genericUnionFind unionValue:element6 and:element8];
    [genericUnionFind unionValue:element8 and:element9];
    
    NSLog(@"%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d",[genericUnionFind isSame:element2 and:element3],
          [genericUnionFind isSame:element1 and:element3],
          [genericUnionFind isSame:element1 and:element2],
          [genericUnionFind isSame:element4 and:element3],
          [genericUnionFind isSame:element5 and:element3],
          [genericUnionFind isSame:element5 and:element4],
          [genericUnionFind isSame:element1 and:element5],
          [genericUnionFind isSame:element2 and:element5],
          [genericUnionFind isSame:element1 and:element4],
          [genericUnionFind isSame:element6 and:element8],
          [genericUnionFind isSame:element6 and:element9],
          [genericUnionFind isSame:element7 and:element8]);


    NSLog(@"--------------------");
    NSLog(@"%d-%d-%d-%d-%d-%d-%d-%d-%d-%d",[genericUnionFind isSame:element1 and:element8],
          [genericUnionFind isSame:element2 and:element8],
          [genericUnionFind isSame:element3 and:element8],
          [genericUnionFind isSame:element4 and:element8],
          [genericUnionFind isSame:element5 and:element8],
          [genericUnionFind isSame:element1 and:element6],
          [genericUnionFind isSame:element2 and:element6],
          [genericUnionFind isSame:element3 and:element6],
          [genericUnionFind isSame:element4 and:element6],
          [genericUnionFind isSame:element5 and:element6]);
    
    
    FYElement *element10 = [[FYElement alloc] initWithAge:9 andName:@"9"];
}



#pragma mark - 获取当前时间
- (NSString *)getNowTimeTimestamp3{
    
    double currentTime =  [[NSDate date] timeIntervalSince1970]*1000;

    NSString *strTime = [NSString stringWithFormat:@"%.0f",currentTime];

    return strTime;
}

@end
