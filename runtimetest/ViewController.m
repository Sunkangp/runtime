//
//  ViewController.m
//  runtimetest
//
//  Created by sunkang on 2018/9/28.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Person *p = [[Person alloc]init];//调用init
    NSLog(@"name:%@ age:%d phone:%@",p.name,p.age,p.phone);
    
    
    
    
    //归档
    Person *p1 = [[Person alloc]init];
    p1.name   =  @"SUN";
    p1.age    =  25;
    p1.phone =  @"110";
    [NSKeyedArchiver archiveRootObject:p1 toFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"]];
    //检测是否归档成功
    BOOL result = [[NSFileManager defaultManager] fileExistsAtPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"]];
    if (result) {
        NSLog(@"归档OK");
    }else{
        NSLog(@"归档NO");
    }
    
    
    
    //反归档
    Person *p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"]];
    NSLog(@"name:%@ age:%d phone:%@",p2.name,p2.age,p2.phone);

    
    
    
    
    //解析 >>> 也可以使用MJExtension     [Person mj_objectWithKeyValues:dict];
    Person *p3 = [[Person alloc]initWithDic:@{@"name":@"SK",
                                              @"phone":@"119",
                                              @"age":@10
                                              }];
    NSLog(@"name:%@ age:%d phone:%@",p3.name,p3.age,p3.phone);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
