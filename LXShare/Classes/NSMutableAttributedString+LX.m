//
//  NSMutableAttributedString+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "NSMutableAttributedString+LX.h"

@implementation NSMutableAttributedString (LX)
/// 字符串【后面】添加图片
/// @param attributedString 完整字符串
/// @param stringArray 字符串数组
/// @param iconName 尾部图片名称
/// @param fontArray 字体数组（对应字符串数组）
/// @param colorArray 字体颜色（对应字符串数组）
/// @param range 图片的位置调整设置
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

/// 字符串【后面】添加图片+间距+行距
/// @param attributedString 完整字符串
/// @param stringArray 字符串数组
/// @param iconName 图片名称
/// @param fontArray 字体数组（对应字符串数组）
/// @param colorArray 字体颜色（对应字符串数组）
/// @param range 图片的位置
/// @param wordSpace 间距
/// @param lineSpace 行距
+ (NSMutableAttributedString *)attributedString:(NSString *)attributedString
                                    stringArray:(NSArray *)stringArray
                                appendImaheName:(NSString *)iconName
                                  withFontArray:(NSArray *)fontArray
                                 withColorArray:(NSArray *)colorArray
                                      withRange:(CGRect)range
                                  withWordSpace:(CGFloat)wordSpace
                                  withLineSpace:(CGFloat)lineSpace
{
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:attributedString
                                                                                         attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attr addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, attributedString.length)];
    
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


/// 字符串【前面】添加图片
/// @param attributedString 完整字符串
/// @param stringArray 字符串数组
/// @param iconName 头部图片名称
/// @param fontArray 字体数组（对应字符串数组）
/// @param colorArray 字体颜色（对应字符串数组）
/// @param range 图片的位置调整设置
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


/// 字符串【前面】添加图片+间距+行距
/// @param attributedString 完整字符串
/// @param stringArray 字符串数组
/// @param iconName 图片名称
/// @param fontArray 字体数组（对应字符串数组）
/// @param colorArray 字体颜色（对应字符串数组）
/// @param range 图片的位置
/// @param wordSpace 间距
/// @param lineSpace 行距
+ (NSMutableAttributedString *)attributedString:(NSString *)attributedString
                                    stringArray:(NSArray *)stringArray
                                insertImaheName:(NSString *)iconName
                                  withFontArray:(NSArray *)fontArray
                                 withColorArray:(NSArray *)colorArray
                                      withRange:(CGRect)range
                                  withWordSpace:(CGFloat)wordSpace
                                  withLineSpace:(CGFloat)lineSpace
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:attributedString
                                                                                         attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attr addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, attributedString.length)];
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
