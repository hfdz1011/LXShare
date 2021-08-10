//
//  UIViewController+Navigation.h
//  LXShare
//
//  Created by Wst on 2021/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  void (^rightButtonBlock)(void);

@interface UIViewController (Navigation)

/// 创建 中间文本 导航
/// @param title 标题
/// @param titleColor 颜色
/// @param titleFont 字体
/// @param bgColor 导航背景色
- (void)lx_createNavigationWithTitle:(NSString *)title   titleColor:(UIColor *)titleColor   titleFont:(UIFont *)titleFont   withBgColor:(UIColor *)bgColor;

/// 创建 左边返回按钮+中间文本 导航
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param title 标题
/// @param color 颜色
/// @param font 字体
/// @param bgColor 背景颜色
- (void)lx_createNavigationLeftIcon:(UIImage *)icon  leftWidth:(CGFloat)leftwidth leftHeight:(CGFloat)leftHeight  title:(NSString *)title  color:(UIColor *)color     font:(UIFont *)font   bgColor:(UIColor *)bgColor;

/// 创建 左边返回按钮+中间文本+右边文本 导航
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param centerTitle 中间文本
/// @param centerColor 中间文本颜色
/// @param centerFont 中间文本字体
/// @param rightTitle 右边文本
/// @param rightColor 右边文本颜色
/// @param rightFont 右边文本字体
/// @param bgColor 背景颜色
/// @param rightBlock 右边点击事件
- (void)lx_createNavigationLeftIcon:(UIImage *)icon     leftWidth:(CGFloat)leftwidth     leftHeight:(CGFloat)leftHeight    centerTitle:(NSString *)centerTitle    centerColor:(UIColor *)centerColor   centerFont:(UIFont *)centerFont   rightTitle:(NSString *)rightTitle   rightColor:(UIColor *)rightColor   rightFont:(UIFont *)rightFont  bgColor:(UIColor *)bgColor  rightClickBlock:(rightButtonBlock)rightBlock;

/// 创建 左边返回按钮+中间文本+右边图标 导航
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param centerTitle 标题
/// @param centerColor 颜色
/// @param centerFont 字体
/// @param rightIcon 右边图标
/// @param iconWidth 按钮宽度
/// @param bgColor 背景颜色
/// @param rightBlock 右边点击事件
- (void)lx_createNavigationLeftIcon:(UIImage *)icon  leftWidth:(CGFloat)leftwidth    leftHeight:(CGFloat)leftHeight  centerTitle:(NSString *)centerTitle  centerColor:(UIColor *)centerColor    centerFont:(UIFont *)centerFont   rightIcon:(UIImage *)rightIcon   iconWidth:(CGFloat)iconWidth   bgColor:(UIColor *)bgColor   rightClickBlock:(rightButtonBlock)rightBlock;

@end

NS_ASSUME_NONNULL_END
