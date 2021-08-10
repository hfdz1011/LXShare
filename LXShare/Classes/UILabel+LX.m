//
//  UILabel+LX.m
//  AFNetworking
//
//  Created by Song on 2020/7/23.
//

#import "UILabel+LX.h"

@implementation UILabel (LX)

/// UILabel初始化 + aline +number
/// @param text 内容
/// @param color 颜色
/// @param font 字体
/// @param align 对其方式
/// @param number 行数
+ (UILabel *)lx_initLableWithString:(NSString * _Nullable)text color:(UIColor * _Nullable)color font:(UIFont * _Nullable)font alignment:(NSTextAlignment) align numberOflines:(NSInteger) number
{
    UILabel *lable = [[UILabel alloc]init];
    lable.text = text;
    lable.textAlignment = align;
    lable.textColor = color;
    lable.font = font;
    lable.numberOfLines = number;
    return lable;
    
}

/// UILabel初始化
/// @param text 设置默认值
/// @param color 颜色
/// @param font 字体
+ (UILabel *)lx_initLableWithString:(NSString * _Nullable)text
                              color:(UIColor * _Nullable)color
                               font:(UIFont * _Nullable)font
{
    UILabel *lable = [[UILabel alloc]init];
    lable.text = text;
    lable.textColor = color;
    lable.font = font;
    return lable;
}

@end
