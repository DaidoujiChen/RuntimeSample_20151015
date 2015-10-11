//
//  NSObject+DaiDeallocDetect.m
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/11.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "NSObject+DaiDeallocDetect.h"
#import <objc/runtime.h>

@interface DaiDeallocDetectObject : NSObject

@property (nonatomic, copy) void (^callback)(void);

- (instancetype)initWithCallback:(void (^)(void))callback;

@end

@implementation DaiDeallocDetectObject

- (instancetype)initWithCallback:(void (^)(void))callback {
    self = [super init];
    if (self) {
        self.callback = callback;
    }
    return self;
}

- (void)dealloc {
    if (self.callback) {
        self.callback();
    }
}

@end

@implementation NSObject (DaiDeallocDetect)

- (void)onDealloc:(void (^)(void))deallocCallback {
    objc_setAssociatedObject(self, _cmd, [[DaiDeallocDetectObject alloc] initWithCallback:deallocCallback], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
