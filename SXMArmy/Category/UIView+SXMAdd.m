//
//  UIView+SXMAdd.m
//  SXMArmyDemo
//
//  Created by syn on 2018/1/9.
//  Copyright © 2018年 sxm. All rights reserved.
//

#import "UIView+SXMAdd.h"
#import <objc/runtime.h>
#import "SXMArmyMacro.h"

SXMSYNTH_DUMMY_CLASS(UIView_SXMAdd)

@implementation UIView (SXMAdd)

#pragma mark - 单击事件

- (void)sxm_whenTapped:(SXMWhenTappedBlock)block
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasTapped)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)viewWasTapped {
    [self runBlockForKey:&kWhenTappedBlockKey];
}

static char kWhenTappedBlockKey;

- (void)runBlockForKey:(void *)blockKey {
    SXMWhenTappedBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}

- (void)setBlock:(SXMWhenTappedBlock)block forKey:(void *)blockKey {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark -

@end
