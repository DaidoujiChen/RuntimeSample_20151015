//
//  MainViewController.m
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/10.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"
#import <objc/runtime.h>
#import "ShowNumberViewController.h"

@implementation MainViewController

#pragma mark - ibaction

- (IBAction)pushAction:(id)sender {
    ShowNumberViewController *showNumberViewController = [ShowNumberViewController new];
    [self.navigationController pushViewController:showNumberViewController animated:YES];
    [Generator setDelegate:showNumberViewController];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [Generator start];
}

@end
