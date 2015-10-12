//
//  Generator.m
//  RuntimeSample_20151015
//
//  Created by DaidoujiChen on 2015/10/12.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "Generator.h"
#import <objc/runtime.h>

@implementation Generator

#pragma mark - private class method

+ (void)setTimer:(NSTimer *)timer {
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSTimer *)timer {
    return objc_getAssociatedObject(self, _cmd);
}

+ (void)loop:(NSTimer *)timer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:(arc4random() % 10) + 1];
        NSInteger randomInteger = arc4random() % 100;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[weakSelf delegate] monitorGenerator:randomInteger];
        });
    });
}

#pragma mark - class method

+ (void)start {
    if (![self timer]) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(loop:) userInfo:nil repeats:YES];
        [self setTimer:timer];
    }
}

+ (void)finish {
    NSTimer *timer = [self timer];
    [timer invalidate];
    [self setTimer:nil];
}

+ (void)setDelegate:(id <GeneratorDelegate>)delegate {
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_ASSIGN);
}

+ (id <GeneratorDelegate>)delegate {
    return objc_getAssociatedObject(self, _cmd);
}

@end
