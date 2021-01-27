//
//  UITableView+LX.h
//  LXShare
//
//  Created by Song on 2020/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LX)

/// UITableView 初始化
/// @param frame frame
/// @param style 类型
/// @param delegate delegate
/// @param dataSource dataSource
+ (UITableView *)lx_initTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id)delegate dataSource:(id)dataSource;
@end

NS_ASSUME_NONNULL_END
