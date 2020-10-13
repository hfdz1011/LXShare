//
//  UIImage+LX.h
//  LXShare
//
//  Created by Song on 2020/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LX)

/// 多图片拼接组装成新图片
/// @param imageArray 图片数组（最多9张）
/// @param width 图片宽度（宽高相等）
/// @param color 图片背景颜色
+ (UIImage *)pictureMosaicForImageArray:(NSMutableArray *)imageArray
                          withSizeWidth:(CGFloat)width
                 withNorBackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
