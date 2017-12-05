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
    if (image == nil) { return nil; }
    
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
    if (image == nil) { return nil; }
    
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

- (nullable instancetype)sxm_thumbnailWithSize:(CGSize)size
{
    if (self == nil) { return nil; }
    
    CGSize originalSize = self.size;
    // 原图片的宽高比
    CGFloat oAspectRatio = self.size.width / self.size.height;
    // 缩略图的宽高比
    CGFloat tAspectRatio = size.width / size.height;
    
    CGRect rect = CGRectZero;
    if (oAspectRatio > tAspectRatio) { // 变宽，高不变
        rect.size.width = originalSize.height * (tAspectRatio);
        rect.size.height = originalSize.height;
        rect.origin.x = (originalSize.width - rect.size.width) / 2;
        rect.origin.y = 0;
    } else if (oAspectRatio < tAspectRatio) { // 变高，宽不变
        rect.size.width = originalSize.width;
        rect.size.height = originalSize.width * (size.height / size.width);
        rect.origin.x = 0;
        rect.origin.y = (originalSize.height - rect.size.height) / 2;
    } else { // 等比例，直接压缩图片
        return [self sxm_compressWithSize:size];;
    }
    
    UIImage *newImage = [self sxm_clipImageWithRect:rect];
    
    newImage = [newImage sxm_compressWithSize:size];
    
    return newImage;
}

- (nullable instancetype)sxm_clipImageWithRect:(CGRect)rect
{
    if (self == nil) { return nil; }
    
    CGImageRef sourceImageRef = [self CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    return newImage;
}

- (nullable instancetype)sxm_compressWithSize:(CGSize)size
{
    if (self == nil) { return nil; }
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
