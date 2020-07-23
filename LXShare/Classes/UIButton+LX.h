//
//  UIButton+LX.h
//  AFNetworking
//
//  Created by Song on 2020/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LX)

/// UIButton初始化
/// @param title 标题
/// @param color 颜色
/// @param font 字体
+ (UIButton *)lx_initButtonWithTitle:(NSString * _Nullable)title
                          titleColor:(UIColor *)color
                           titleFont:(UIFont *)font;

/// UIButton初始化 + target + action
/// @param title 标题
/// @param color 颜色
/// @param font 字体
/// @param target target
/// @param action 事件
+ (UIButton *)lx_initButtonWithTitle:(NSString * _Nullable)title
                          titleColor:(UIColor *)color
                           titleFont:(UIFont *)font
                              target:(id)target
                              action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
