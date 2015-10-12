//
//  ShowNumberViewController.m
//  RuntimeSample_20151015
//
//  Created by 啟倫 陳 on 2015/10/12.
//  Copyright © 2015年 ChilunChen. All rights reserved.
//

#import "ShowNumberViewController.h"

@interface ShowNumberViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation ShowNumberViewController

#pragma mark - GeneratorDelegate

- (void)monitorGenerator:(NSInteger)number {
    self.numberLabel.text = [NSString stringWithFormat:@"%td", number];
}

@end
