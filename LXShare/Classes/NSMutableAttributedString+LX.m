//
//  NSMutableAttributedString+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "NSMutableAttributedString+LX.h"

@implementation NSMutableAttributedString (LX)

+ (NSMutableAttributedString *)attributedString:(NSString *)attributedString
                                    stringArray:(NSArray *)stringArray
                                appendImaheName:(NSString *)iconName
                                  withFontArray:(NSArray *)fontArray
                                 withColorArray:(NSArray *)colorArray
                                      withRange:(CGRect)range
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    
    if (iconName.length) {
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.bounds = range;
        attch.image = [UIImage imageNamed:iconName];
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [attr insertAttributedString:string atIndex:attributedString.length];
    }
    
    NSString *indexString = @"";
    
    for (int i = 0; i < stringArray.count; i++) {
        
        NSString *titleString = stringArray[i];
        
        UIColor *color = (UIColor *)colorArray[i];
        UIFont *font = (UIFont *)fontArray[i];
        
        if (iconName.length) {
            
            [attr addAttribute:NSForegroundColorAttributeName
                         value:color
                         range:NSMakeRange(indexString.length, titleString.length)];
            [attr addAttribute:NSFontAttributeName
                         value:font
                         range:NSMakeRange(indexString.length, titleString.length)];
            
        }else{
            
            [attr addAttribute:NSForegroundColorAttributeName
                         value:color
                         range:NSMakeRange(indexString.length, titleString.length)];
            [attr addAttribute:NSFontAttributeName
                         value:font
                         range:NSMakeRange(indexString.length, titleString.length)];
        }
        indexString = [NSString stringWithFormat:@"%@%@",indexString,titleString];
    }
    return attr;
}

+ (NSMutableAttributedString *)attributedString:(NSString *)attributedString
                                    stringArray:(NSArray *)stringArray
                                insertImaheName:(NSString *)iconName
                                  withFontArray:(NSArray *)fontArray
                                 withColorArray:(NSArray *)colorArray
                                      withRange:(CGRect)range
{
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    
    if (iconName.length) {
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.bounds = range;
        attch.image = [UIImage imageNamed:iconName];
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [attr insertAttributedString:string atIndex:0];
    }
    
    NSString *indexString = @"";
    
    for (int i = 0; i < stringArray.count; i++) {
        
        NSString *titleString = stringArray[i];
        
        UIColor *color = (UIColor *)colorArray[i];
        UIFont *font = (UIFont *)fontArray[i];
        
        if (iconName.length) {
            
            [attr addAttribute:NSForegroundColorAttributeName
                         value:color
                         range:NSMakeRange(indexString.length+1, titleString.length)];
            [attr addAttribute:NSFontAttributeName
                         value:font
                         range:NSMakeRange(indexString.length+1, titleString.length)];
            
        }else{
            
            [attr addAttribute:NSForegroundColorAttributeName
                         value:color
                         range:NSMakeRange(indexString.length, titleString.length)];
            [attr addAttribute:NSFontAttributeName
                         value:font
                         range:NSMakeRange(indexString.length, titleString.length)];
        }
        
        indexString = [NSString stringWithFormat:@"%@%@",indexString,titleString];
    }
    return attr;
}

@end
