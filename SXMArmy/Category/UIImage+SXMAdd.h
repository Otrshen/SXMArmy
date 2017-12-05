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
+ (nullable instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName logoImageName:(NSString *)logoImageName logoLocation:(SXMLocation)location;

/**
 添加文字水印

 @param bgImageName 图片
 @param title 水印字符串
 @param location 水印位置
 @return 图片
 */
+ (nullable instancetype)sxm_imageWithBgImageName:(NSString *)bgImageName title:(NSString *)title titleFont:(nullable UIFont *)titleFont titleColor:(nullable UIColor *)titleColor logoLocation:(SXMLocation)location;

/**
 根据原图生成指定尺寸的缩略图
 原图如不符合指定尺寸的比例，则先根据指定尺寸的比例剪切原图再压缩图片。

 @param size 指定尺寸
 @return 图片
 */
- (nullable instancetype)sxm_thumbnailWithSize:(CGSize)size;

/**
 根据指定位置剪切原图

 @param rect 指定位置
 @return 图片
 */
- (nullable instancetype)sxm_clipImageWithRect:(CGRect)rect;

/**
 根据指定大小压缩图片，不考虑图片比例

 @param size 指定大小
 @return 图片
 */
- (nullable instancetype)sxm_compressWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
