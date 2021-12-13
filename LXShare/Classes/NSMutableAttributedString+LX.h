//
//  NSMutableAttributedString+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (LX)

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
                                      withRange:(CGRect)range;
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
                                  withLineSpace:(CGFloat)lineSpace;

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
                                      withRange:(CGRect)range;

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
                                  withLineSpace:(CGFloat)lineSpace;

@end

NS_ASSUME_NONNULL_END
