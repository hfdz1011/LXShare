//
//  NSMutableAttributedString+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "NSMutableAttributedString+LX.h"

@implementation NSMutableAttributedString (LX)


+ (NSMutableAttributedString *)lx_inserIconFirst:(NSString *)iconName withAttributedString:(NSString *)attributedString withFont:(UIFont *)font withColor:(UIColor *)color
{
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.bounds = CGRectMake(2, -2, 18, 18);
    attch.image = [UIImage imageNamed:iconName];
    
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    [attr insertAttributedString:string atIndex:0];
    [attr addAttribute:NSForegroundColorAttributeName
                 value:color
                 range:NSMakeRange(0, attr.length)];
    [attr addAttribute:NSFontAttributeName
                 value:font
                 range:NSMakeRange(0 , attr.length)];
    return attr;
    
}


@end
