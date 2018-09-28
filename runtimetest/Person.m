//
//  Person.m
//  runtimetest
//
//  Created by sunkang on 2018/9/28.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>


@interface Person()<NSCoding>

@end

@implementation Person

-(instancetype)init{
    if (self = [super init]) {
        //一般写法
//        self.name = @"";
//        self.phone = @"110";
//        self.age = 0;
        
        //runtime
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([Person class], &count);//获取所以属性
        for (int i = 0; i< count; i++) {
            Ivar ivar = ivars[i];//属性名称
            const char * name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];//C-->OC
            [self setValue:@"" forKey:key];//赋值初始化
        }
        free(ivars);//释放
    }
    return self;
}

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //一般写法
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeObject:@(_age) forKey:@"age"];
//    [aCoder encodeObject:_phone forKey:@"phone"];

    //runtime
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([Person class], &count);//获取所以属性
    for (int i = 0; i< count; i++) {
        Ivar ivar = ivars[i];//属性名称
        const char * name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];//C-->OC
        id value = [self valueForKey:key];//取值
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);//释放
}

//反编码
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        //一般写法
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.phone = [aDecoder decodeObjectForKey:@"phone"];
//        self.age = [[aDecoder decodeObjectForKey:@"age"] intValue];
        //runtime
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([Person class], &count);//获取所以属性
        for (int i = 0; i< count; i++) {
            Ivar ivar = ivars[i];//属性名称
            const char * name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];//C-->OC
            id value = [aDecoder decodeObjectForKey:key];//取值
            [self setValue:value forKey:key];//赋值
        }
        free(ivars);//释放
        
    }
    return self;
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //一般写法
//        self.name = dic[@"name"];
//        self.phone = dic[@"phone"];
//        self.age = [dic[@"age"] intValue];
        //runtime
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([Person class], &count);//获取所以属性
        for (int i = 0; i< count; i++) {
            Ivar ivar = ivars[i];//属性名称
            const char * name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];//C-->OC
            id value = dic[[key substringFromIndex:1]];//取值
            [self setValue:value forKey:key];//赋值
        }
        free(ivars);//释放
    }
    return self;
    
}






@end
