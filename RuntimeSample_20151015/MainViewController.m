//
//  MainViewController.m
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/10.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"
#import <objc/runtime.h>

@implementation MainViewController

static const char *key = "myKey";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMyString:@"myString"];
    NSLog(@"%@", [self myString]);
    objc_removeAssociatedObjects(self);
    NSLog(@"%@", [self myString]);
}

- (void)setMyString:(NSString *)myString {
    objc_setAssociatedObject(self, &key, myString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)myString {
    return objc_getAssociatedObject(self, &key);
}

@end
