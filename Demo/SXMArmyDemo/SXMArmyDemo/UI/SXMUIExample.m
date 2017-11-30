//
//  SXMUIExample.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/29.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMUIExample.h"

@interface SXMUIExample ()

@end

@implementation SXMUIExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UI";
    
    self.titles = [NSMutableArray array];
    self.classNames = [NSMutableArray array];
    
    [self addCell:@"StatusBarMessage" class:@"SXMStatusBarMessageExample"];
}

@end
