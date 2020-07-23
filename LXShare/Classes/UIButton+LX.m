//
//  UIButton+LX.m
//  AFNetworking
//
//  Created by Song on 2020/7/23.
//

#import "UIButton+LX.h"

@implementation UIButton (LX)

+ (UIButton *)lx_initButtonWithTitle:(NSString * _Nullable)title titleColor:(UIColor *)color titleFont:(UIFont *)font
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    return button;
}

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
