//
//  Generator.h
//  RuntimeSample_20151015
//
//  Created by DaidoujiChen on 2015/10/12.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GeneratorDelegate;

@interface Generator : NSObject

+ (void)start;
+ (void)finish;
+ (void)setDelegate:(id <GeneratorDelegate>)delegate;

@end

@protocol GeneratorDelegate <NSObject>

- (void)monitorGenerator:(NSInteger)number;

@end
