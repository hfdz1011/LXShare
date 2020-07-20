//
//  UIAlertController+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (LX)

typedef void (^ clickedIndex) (UIAlertAction* action);

/// 弹出视图 ActSheet
/// @param title 标题
/// @param message 信息
/// @param target 控制器
/// @param clickedHandle 点击的按钮
/// @param buttons 按钮字典
+ (void)lx_showActSheetWithTitle:(NSString*)title
                         message:(NSString*)message
                          target:(id)target
                   clickedHandle:(clickedIndex)clickedHandle
                         buttons:(NSDictionary*)buttons,...;

/// 弹出视图 UIAlert
/// @param title 标题
/// @param message 信息
/// @param target 控制器
/// @param clickedHandle 点击的按钮
/// @param buttons 按钮字典
+ (void)lx_showAlertWithTitle:(NSString*)title
                      message:(NSString*)message
                       target:(id)target
                clickedHandle:(clickedIndex)clickedHandle
                      buttons:(NSDictionary*)buttons,...;
@end

NS_ASSUME_NONNULL_END
