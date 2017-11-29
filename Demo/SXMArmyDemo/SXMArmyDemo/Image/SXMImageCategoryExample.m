//
//  SXMImageCategoryExample.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMImageCategoryExample.h"
#import "SXMArmy.h"

@interface SXMImageCategoryExample ()
@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@end

@implementation SXMImageCategoryExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.testImage.image = [UIImage sxm_imageWithBgImageName:@"test.png" logoImageName:@"logo_120.png" logoLocation:SXMLocationLowerLeftCorner];

    self.testImage.image = [UIImage sxm_imageWithBgImageName:@"test.png" title:@"@sxm" titleFont:nil titleColor:nil logoLocation:SXMLocationLowerLeftCorner];
}

@end
