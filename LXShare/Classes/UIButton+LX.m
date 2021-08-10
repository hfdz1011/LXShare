//
//  UIButton+LX.m
//  AFNetworking
//
//  Created by Song on 2020/7/23.
//

#import "UIButton+LX.h"

@implementation UIButton (LX)
/// UIButton初始化
/// @param title 标题
/// @param color 颜色
/// @param font 字体
+ (UIButton *)lx_initButtonWithTitle:(NSString * _Nullable)title titleColor:(UIColor *)color titleFont:(UIFont *)font
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    return button;
}
/// UIButton初始化 + target + action
/// @param title 标题
/// @param color 颜色
/// @param font 字体
/// @param target target
/// @param action 事件
+ (UIButton *)lx_initButtonWithTitle:(NSString * _Nullable)title titleColor:(UIColor *)color titleFont:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
