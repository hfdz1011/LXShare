//
//  UITextField+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "UITextField+LX.h"

@implementation UITextField (LX)

+ (UITextField *)lx_setTextFiled:(UITextField *)filed withPlace:(NSString *)place withPlaceColor:(UIColor *)color withFont:(UIFont *)font
{
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 13.0) {
           
           filed.attributedPlaceholder = [[NSAttributedString alloc] initWithString:place attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:font}];
       }else{
           
           filed.placeholder = place;
           [filed setValue:color forKeyPath:@"_placeholderLabel.textColor"];
           [filed setValue:font forKeyPath:@"_placeholderLabel.font"];
       }
    return filed;
}

@end
