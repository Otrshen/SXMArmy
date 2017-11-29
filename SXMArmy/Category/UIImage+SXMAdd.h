//
//  UIImage+SXMAdd.h
//  SXMArmyDemo
//
//  Created by syn on 2017/11/28.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SXMLocation) {
    SXMLocationTopRightCorner,  // 右上角
    SXMLocationLowerLeftCorner, // 左下角
};

@interface UIImage (SXMAdd)

/**
 添加图片水印

 @param bgImageName 图片
 @param logoImageName 水印图片
 @param location 水印位置
 @return 图片
 */
+ (instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName logoImageName:(NSString *)logoImageName logoLocation:(SXMLocation)location;

/**
 添加文字水印

 @param bgImageName 图片
 @param title 水印字符串
 @param location 水印位置
 @return 图片
 */
+ (instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName title:(NSString *)title titleFont:(nullable UIFont *)titleFont titleColor:(nullable UIColor *)titleColor logoLocation:(SXMLocation)location;

@end

NS_ASSUME_NONNULL_END
