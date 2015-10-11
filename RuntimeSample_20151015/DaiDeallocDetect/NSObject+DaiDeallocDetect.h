//
//  NSObject+DaiDeallocDetect.h
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/11.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DaiDeallocDetect)

- (void)onDealloc:(void (^)(void))deallocCallback;

@end
