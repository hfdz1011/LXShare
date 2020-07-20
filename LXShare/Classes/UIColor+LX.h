//
//  UIColor+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LX)

/// 字符串转颜色
/// @param color 颜色字符串 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度 0～1
+ (UIColor *)lx_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)lx_colorWithHexString:(NSString *)color;

+ (UIImage *)lx_createImageWithColor:(UIColor *) color;

@end

NS_ASSUME_NONNULL_END
