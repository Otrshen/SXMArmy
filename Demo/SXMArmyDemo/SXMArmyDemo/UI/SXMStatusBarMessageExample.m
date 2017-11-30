//
//  SXMStatusBarMessageExample.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/30.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMStatusBarMessageExample.h"
#import "SXMArmy.h"

@interface SXMStatusBarMessageExample ()

@end

@implementation SXMStatusBarMessageExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)show:(id)sender {
    UIImage *image = [UIImage imageNamed:@"shield"];
//    UIColor *bgColor = [UIColor colorWithRed:(209 / 255.0) green:(239 / 255.0) blue:(214 / 255.0) alpha:1];
    UIColor *bgColor = [UIColor blackColor];
    [SXMStatusBarMessageView sxm_showNotificationWithTitle:@"欢迎使用SXMArmy" titleColor:nil titleFont:nil image:image bgColor:bgColor];
}


@end
