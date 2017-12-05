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
@property (weak, nonatomic) IBOutlet UIImageView *compressImage;

@end

@implementation SXMImageCategoryExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.testImage.image = [UIImage sxm_imageWithBgImageName:@"test.png" logoImageName:@"logo_120.png" logoLocation:SXMLocationLowerLeftCorner];

    self.testImage.image = [UIImage sxm_imageWithBgImageName:@"test" title:@"@sxm" titleFont:nil titleColor:nil logoLocation:SXMLocationLowerLeftCorner];
    
    self.compressImage.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)compressImage:(id)sender {
    UIImage *image = [UIImage imageNamed:@"test"];
    UIImage *newImage = [image sxm_thumbnailWithSize:CGSizeMake(200, 150)];
    self.compressImage.image = newImage;

    // 将图片写到文件中
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"compress.png"];
    NSLog(@"%@", path);
    
    NSData *data = UIImageJPEGRepresentation(newImage, 0.1);
    if (data == nil) {
        data = UIImagePNGRepresentation(newImage);
    }
    [data writeToFile:path atomically:YES];
}

@end
