//
//  UITextField+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "UITextField+LX.h"

@implementation UITextField (LX)

+ (UITextField *)lx_initTextFiledWithPlace:(NSString *)placeString withColor:(UIColor *)color withFont:(UIFont *)font  withPlacecolor:(UIColor *)placeColor withplaceFont:(UIFont *)placeFont
{
    
    UITextField *filed = [[UITextField alloc]init];
    filed.font = font;
    filed.textColor = color;
    
    filed.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeString attributes:@{NSForegroundColorAttributeName: placeColor,NSFontAttributeName:placeFont}];
    
    return filed;
}




+ (UITextField *)lx_setTextFiled:(UITextField *)filed withPlace:(NSString *)place withPlaceColor:(UIColor *)color withFont:(UIFont *)font
{
    
    filed.attributedPlaceholder = [[NSAttributedString alloc] initWithString:place attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:font}];
   
    return filed;
}


@end
