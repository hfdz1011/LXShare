//
//  UIAlertController+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "UIAlertController+LX.h"

@implementation UIAlertController (LX)
/// 弹出视图 ActSheet
/// @param title 标题
/// @param message 信息
/// @param target 控制器
/// @param clickedHandle 点击的按钮
/// @param buttons 按钮字典
+ (void)lx_showActSheetWithTitle:(NSString *)title
                         message:(NSString *)message
                          target:(id)target
                   clickedHandle:(clickedIndex)clickedHandle
                         buttons:(NSDictionary *)buttons, ...
{
    if (title == nil) title = @"";
    if (message == nil) message = @"";
    UIAlertController* actionSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    /* 解析所有的动态参数 */
    NSMutableArray* allArgBtns = [NSMutableArray array];
    va_list list;
    NSDictionary* btnNode;
    if (buttons) {
        [allArgBtns addObject:buttons];
        
        va_start(list, buttons);
        while ((btnNode = va_arg(list, NSDictionary*))) {
            [allArgBtns addObject:btnNode];
        }
        va_end(list);
    }
    
    /* 添加所有的点击按钮到controller */
    for (int i = 0 ; i < allArgBtns.count; i++) {
        NSDictionary* btn = allArgBtns[i];
        NSInteger style = [btn.allKeys.firstObject integerValue];
        NSString* btnTitle = btn.allValues.firstObject;
        UIAlertAction* btnAction = [UIAlertAction actionWithTitle:btnTitle style:style handler:^(UIAlertAction * _Nonnull action) {
            if (clickedHandle) {
                clickedHandle(action);
            }
            [actionSheet dismissViewControllerAnimated:YES completion:^{
            }];
        }];
        [actionSheet addAction:btnAction];
    }
    
    /* 显示 */
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [target presentViewController:actionSheet animated:YES completion:nil];
    }];
    
}

/// 弹出视图 UIAlert
/// @param title 标题
/// @param message 信息
/// @param target 控制器
/// @param clickedHandle 点击的按钮
/// @param buttons 按钮字典
+ (void)lx_showAlertWithTitle:(NSString *)title message:(NSString *)message target:(id)target clickedHandle:(clickedIndex)clickedHandle buttons:(NSDictionary *)buttons, ...
{
    if (title == nil) title = @"";
    if (message == nil) message = @"";
    UIAlertController* alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    /* 解析所有的动态参数 */
    NSMutableArray* allArgBtns = [NSMutableArray array];
    va_list list;
    NSDictionary* btnNode;
    if (buttons) {
        [allArgBtns addObject:buttons];
        
        va_start(list, buttons);
        while ((btnNode = va_arg(list, NSDictionary*))) {
            [allArgBtns addObject:btnNode];
        }
        va_end(list);
    }
    
    /* 添加所有的点击按钮到controller */
    for (int i = 0 ; i < allArgBtns.count; i++) {
        NSDictionary* btn = allArgBtns[i];
        NSInteger style = [btn.allKeys.firstObject integerValue];
        NSString* btnTitle = btn.allValues.firstObject;
        UIAlertAction* btnAction = [UIAlertAction actionWithTitle:btnTitle style:style handler:^(UIAlertAction * _Nonnull action) {
            if (clickedHandle) {
                clickedHandle(action);
            }
            [alertView dismissViewControllerAnimated:YES completion:^{
            }];
        }];
        [alertView addAction:btnAction];
    }
    
    /* 显示 */
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [target presentViewController:alertView animated:YES completion:nil];
    }];
}

//[UIAlertController lx_showAlertWithTitle:@"标题部分"
//                                    message:@"信息部分"
//                                     target:self
//                              clickedHandle:^(UIAlertAction *action) {
//
//       if ([action.title isEqualToString:@"确定"]) {
//       }
//   } buttons:@{
//       @(UIAlertActionStyleDefault):@"确定"},@{@(UIAlertActionStyleCancel):@"取消"},nil];

@end
