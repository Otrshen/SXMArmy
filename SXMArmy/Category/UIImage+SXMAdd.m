//
//  UIImage+SXMAdd.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "UIImage+SXMAdd.h"

@implementation UIImage (SXMAdd)

+ (instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName logoImageName:(NSString *)logoImageName logoLocation:(SXMLocation)location
{
    UIImage *image = [UIImage imageNamed:bgImageName];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *logoImage = [UIImage imageNamed:logoImageName];
    
    CGFloat margin = 10;
    CGFloat logoY = 0;
    if (location == SXMLocationTopRightCorner) {
        logoY = margin;
    } else {
        logoY = image.size.height - logoImage.size.height - margin;
    }
    CGFloat logoX = image.size.width - logoImage.size.width - margin;
    [logoImage drawAtPoint:CGPointMake(logoX, logoY)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor logoLocation:(SXMLocation)location
{
    UIImage *image = [UIImage imageNamed:bgImageName];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero];
    
    titleFont = titleFont != nil ? titleFont : [UIFont systemFontOfSize:14];
    titleColor = titleColor != nil ? titleColor : [UIColor whiteColor];
    
    CGSize fontSize = [title sizeWithAttributes:@{NSFontAttributeName : titleFont}];
    
    CGFloat margin = 10;
    CGFloat logoY = 0;
    if (location == SXMLocationTopRightCorner) {
        logoY = margin;
    } else {
        logoY = image.size.height - fontSize.height - margin;
    }
    CGFloat logoX = image.size.width - fontSize.width - margin;
    [title drawAtPoint:CGPointMake(logoX, logoY) withAttributes:@{NSFontAttributeName : titleFont, NSForegroundColorAttributeName : titleColor}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
