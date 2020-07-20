//
//  NSMutableAttributedString+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (LX)

/// 在字符串前添加图片
/// @param iconName 图片名称
/// @param attributedString 字符串
/// @param font 字符串的字体设置
/// @param color 字符串的颜色设置
+ (NSMutableAttributedString *)lx_inserIconFirst:(NSString *)iconName
                            withAttributedString:(NSString *)attributedString
                                        withFont:(UIFont *)font
                                       withColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
