//
//  SXMStatusBarMessageView.m
//  SXMArmyDemo
//
//  Created by syn on 2017/11/29.
//  Copyright © 2017年 sxm. All rights reserved.
//

#import "SXMStatusBarMessageView.h"

#define kiPhoneX ([UIScreen mainScreen].bounds.size.height == 812)
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SXMStatusBarMessageView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *icon;

@end

@implementation SXMStatusBarMessageView

+ (void)sxm_showNotificationWithTitle:(NSString *)title
                           titleColor:(UIColor *)color
                            titleFont:(UIFont *)font
                                image:(UIImage *)image
                              bgColor:(UIColor *)bgColor
{
    [[[self alloc] init] pm_showNotificationWithTitle:title titleColor:color titleFont:font image:image bgColor:bgColor];
}

- (void)pm_showNotificationWithTitle:(NSString *)title
                           titleColor:(UIColor *)color
                            titleFont:(UIFont *)font
                                image:(UIImage *)image
                              bgColor:(UIColor *)bgColor
{
    if (title == nil || title.length == 0) {
        return;
    }
    
    // 赋默认值
    color = color != nil ? color : [UIColor whiteColor];
    font = font != nil ? font : [UIFont systemFontOfSize:14];
    bgColor = bgColor != nil ? bgColor : [UIColor greenColor];
    
    self.bgView.backgroundColor = bgColor;
    
    self.titleLabel.text = title;
    self.titleLabel.textColor = color;
    self.titleLabel.font = font;
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName : font}];
    CGFloat titleLabelX = 0;
    CGFloat titleLabelY = 0;
    
    if (image == nil) {
        titleLabelX = (KScreenWidth - titleSize.width) / 2;
        if (kiPhoneX) {
            titleLabelY = ([self pm_getBgViewHeight] - titleSize.height - 5);
        } else {
            titleLabelY = ([self pm_getBgViewHeight] - titleSize.height) / 2;
        }
        _titleLabel.frame = (CGRect){{titleLabelX, titleLabelY}, titleSize};
    } else {
        self.icon.image = image;
        
        CGFloat margin = 5; // 图片与文字的间距
        CGSize imageSize = [self pm_getImageSize];
        CGFloat imageViewX = (KScreenWidth - (imageSize.width + titleSize.width + margin)) / 2;
        CGFloat imageViewY = ([self pm_getBgViewHeight] - imageSize.height) / 2;
        self.icon.frame = (CGRect){{imageViewX, imageViewY}, imageSize};
        
        titleLabelX = CGRectGetMaxX(self.icon.frame) + margin;
        titleLabelY = ([self pm_getBgViewHeight] - titleSize.height) / 2;
        _titleLabel.frame = (CGRect){{titleLabelX, titleLabelY}, titleSize};
    }
    
    [self sxm_show];
}

- (void)sxm_show
{
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.bgView.frame;
        frame.origin.y = 0;
        self.bgView.frame = frame;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            [self sxm_hidden];
        });
    }];
}

- (void)sxm_hidden
{
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.bgView.frame;
        frame.origin.y = -frame.size.height;
        self.bgView.frame = frame;
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
    }];
}

- (void)dealloc
{
    NSLog(@"SXMStatusBarMessageView_dealloc");
}

#pragma mark - 私有方法

// 获取bgView高度
- (CGFloat)pm_getBgViewHeight
{
    if (kiPhoneX) {
        return 60;
    } else {
        return 20;
    }
}

// 获取image的大小
- (CGSize)pm_getImageSize
{
    if (kiPhoneX) {
        return CGSizeMake(20, 20);
    } else {
        return CGSizeMake(10, 10);
    }
}

#pragma mark - lazy

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -([self pm_getBgViewHeight]), KScreenWidth, [self pm_getBgViewHeight])];
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        [statusBar addSubview:_bgView];
        return _bgView;
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.bgView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)icon
{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.bounds = CGRectMake(0, 0, [self pm_getImageSize].width, [self pm_getImageSize].height);
        [self.bgView addSubview:_icon];
        return _icon;
    }
    return _icon;
}

@end
