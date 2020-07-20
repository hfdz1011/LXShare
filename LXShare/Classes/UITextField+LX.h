//
//  UITextField+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (LX)

/// UITextField 设置虚拟文字的颜色和字体
/// @param filed UITextField
/// @param place 虚拟文字的文案
/// @param color 颜色
/// @param font 字体
+ (UITextField *)lx_setTextFiled:(UITextField *)filed withPlace:(NSString *)place withPlaceColor:(UIColor *)color withFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
