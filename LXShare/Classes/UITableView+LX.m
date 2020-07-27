//
//  UITableView+LX.m
//  LXShare
//
//  Created by Song on 2020/7/23.
//

#import "UITableView+LX.h"

@implementation UITableView (LX)

+ (UITableView *)lx_initTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id)delegate dataSource:(id)dataSource
{
    
    UITableView *table = [[UITableView alloc]initWithFrame:frame style:style];
    table.delegate = delegate;
    table.dataSource = dataSource;
    table.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    if (@available(iOS 11.0, *)) {
        table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
//         self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return table;
}

@end
