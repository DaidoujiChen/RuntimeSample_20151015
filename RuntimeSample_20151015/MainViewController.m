//
//  MainViewController.m
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/10.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"
#import "NSObject+DaiDeallocDetect.h"

@implementation MainViewController

#pragma mark - ibaction

- (IBAction)pushAction:(id)sender {
    [self.navigationController pushViewController:[MainViewController new] animated:YES];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"- Level : %td -", self.navigationController.viewControllers.count];
    
    [self onDealloc: ^() {
        NSLog(@"viewDidLoad: -> dealloc");
    }];
}

- (void)dealloc {
    NSLog(@"controller -> dealloc : %@", self);
}

@end
