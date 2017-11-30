//
//  SXMStatusBarMessageView.h
//  SXMArmyDemo
//
//  Created by syn on 2017/11/29.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SXMStatusBarMessageView : UIView

/**
 显示信息, 暂不支持横屏

 @param title 信息内容
 @param color 信息内容颜色
 @param font 字体大小
 @param image 显示图片大小
 @param bgColor 背景颜色
 */
+ (void)sxm_showNotificationWithTitle:(NSString *)title
                           titleColor:(nullable UIColor *)color
                            titleFont:(nullable UIFont *)font
                                image:(nullable UIImage *)image
                              bgColor:(nullable UIColor *)bgColor;

@end

NS_ASSUME_NONNULL_END
