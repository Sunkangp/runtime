//
//  Person.h
//  runtimetest
//
//  Created by sunkang on 2018/9/28.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) int age;

-(instancetype)init;

-(instancetype)initWithDic:(NSDictionary*)dic;


@end
