//
//  SXMBaseTableViewController.h
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXMBaseTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

- (void)addCell:(NSString *)title class:(NSString *)className;

@end
