//
//  UIColor+Util.h
//  SXMArmyDemo
//
//  Created by syn on 2018/1/9.
//  Copyright © 2016年 syn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SXMAdd)

/**
 设置十六进制颜色

 @param hexString 十六进制字符串
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)sxm_colorWithHex:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 设置十六进制颜色

 @param hexString 十六进制字符串
 @return UIColor
 */
+ (UIColor *)sxm_colorWithHex:(NSString *)hexString;

@end
