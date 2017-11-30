//
//  SXMRootTableViewController.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMRootTableViewController.h"

@interface SXMRootTableViewController ()

@end

@implementation SXMRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"演示";
    
    self.titles = [NSMutableArray array];
    self.classNames = [NSMutableArray array];
    
    [self addCell:@"Image" class:@"SXMImageExample"];
    [self addCell:@"UI" class:@"SXMUIExample"];
}

@end
