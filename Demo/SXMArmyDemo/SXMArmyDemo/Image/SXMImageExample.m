//
//  SXMImageExample.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMImageExample.h"

@interface SXMImageExample ()

@end

@implementation SXMImageExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Image";
    
    self.titles = [NSMutableArray array];
    self.classNames = [NSMutableArray array];
    
    [self addCell:@"ImageCategory" class:@"SXMImageCategoryExample"];
}

@end
