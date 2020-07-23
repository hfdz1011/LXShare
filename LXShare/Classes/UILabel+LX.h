//
//  UILabel+LX.h
//  AFNetworking
//
//  Created by Song on 2020/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LX)

/// UILabel初始化 + aline +number
/// @param text 内容
/// @param color 颜色
/// @param font 字体
/// @param align 对其方式
/// @param number 行数
+ (UILabel *)lx_initLableWithString:(NSString * _Nullable)text
                              color:(UIColor * _Nullable)color
                               font:(UIFont * _Nullable)font
                          alignment:(NSTextAlignment)align
                      numberOflines:(NSInteger)number;

/// UILabel初始化
/// @param text 内容
/// @param color 颜色
/// @param font 字体
+ (UILabel *)lx_initLableWithString:(NSString * _Nullable)text
                              color:(UIColor * _Nullable)color
                               font:(UIFont * _Nullable)font;

@end

NS_ASSUME_NONNULL_END
