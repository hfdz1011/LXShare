//
//  UIImage+LX.m
//  LXShare
//
//  Created by Song on 2020/7/24.
//

#import "UIImage+LX.h"
#import "UIColor+LX.h"
@implementation UIImage (LX)
/// 多图片拼接组装成新图片
/// @param imageArray 图片数组（最多9张）
/// @param width 图片宽度（宽高相等）
/// @param color 图片背景颜色
+ (UIImage *)pictureMosaicForImageArray:(NSMutableArray *)imageArray withSizeWidth:(CGFloat)width withNorBackgroundColor:(UIColor *)color
{
    CGSize offScreenSize = CGSizeMake(width, width);
    
    UIGraphicsBeginImageContext(offScreenSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);//图片背景色
    CGContextFillRect(context, CGRectMake(0, 0, width, width));
    //确定拼接图片的宽度
    CGFloat imageWidth = [self generateImageWidthWithImageCount:imageArray.count withWidth:width];
    
    switch (imageArray.count) {
            
        case 2:
        {
            CGFloat row_1_origin_y = (width - imageWidth) / 2;
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y withWidth:width];
        }
            break;
        case 3:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 2) / 3;
            
            UIImage* image_1 = imageArray[0];
            CGRect rect_1 = CGRectMake((width - imageWidth) / 2, row_1_origin_y, imageWidth, imageWidth);
            [image_1 drawInRect:rect_1];
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y + imageWidth + 10 withWidth:width];
        }
            break;
        case 4:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 2) / 3;
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y withWidth:width];
        }
            break;
        case 5:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 2 - 10) / 2;
            
            UIImage* image_1 = imageArray[0];
            CGRect rect_1 = CGRectMake((width - 2 * imageWidth - 10) / 2, row_1_origin_y, imageWidth, imageWidth);
            [image_1 drawInRect:rect_1];
            
            UIImage* image_2 = imageArray[1];
            CGRect rect_2 = CGRectMake(rect_1.origin.x + imageWidth + 10, row_1_origin_y, imageWidth, imageWidth);
            [image_2 drawInRect:rect_2];
            
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y + imageWidth + 10 withWidth:width];
        }
            break;
        case 6:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 2 - 10) / 2;
            
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y withWidth:width];
        }
            break;
        case 7:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 3) / 4;
            
            UIImage* image_1 = imageArray[0];
            CGRect rect_1 = CGRectMake((width - imageWidth) / 2, row_1_origin_y, imageWidth, imageWidth);
            [image_1 drawInRect:rect_1];
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y + imageWidth + 10 withWidth:width];
        }
            break;
        case 8:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 3) / 4;
            
            UIImage* image_1 = imageArray[0];
            CGRect rect_1 = CGRectMake((width - 2 * imageWidth - 10) / 2, row_1_origin_y, imageWidth, imageWidth);
            [image_1 drawInRect:rect_1];
            UIImage* image_2 = imageArray[1];
            CGRect rect_2 = CGRectMake(rect_1.origin.x + imageWidth + 10, row_1_origin_y, imageWidth, imageWidth);
            [image_2 drawInRect:rect_2];
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y + imageWidth + 10 withWidth:width];
        }
            break;
        case 9:
        {
            CGFloat row_1_origin_y = (width - imageWidth * 3) / 4;
            [self generatorMatrix:imageArray beginOriginY:row_1_origin_y withWidth:width];
        }
            break;
        default:
            break;
    }
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imagez;
}

+ (void)generatorMatrix:(NSArray *)images beginOriginY:(CGFloat)beginOriginY withWidth:(CGFloat)width{
    int count = (int)images.count;
    
    int cellCount;
    int maxRow;
    int maxColumn;
    int ignoreCountOfBegining;
    
    if (count <= 4)
    {
        maxRow = 2;
        maxColumn = 2;
        ignoreCountOfBegining = count % 2;
        cellCount = 4;
    }
    else
    {
        maxRow = 3;
        maxColumn = 3;
        ignoreCountOfBegining = count % 3;
        cellCount = 9;
    }
    CGFloat imageWidth = [self generateImageWidthWithImageCount:images.count withWidth:width];
    
    for (int i = 0; i < cellCount; i++) {
        if (i > images.count - 1) break;
        if (i < ignoreCountOfBegining) continue;
        
        int row = floor((float)(i - ignoreCountOfBegining) / maxRow);
        int column = (i - ignoreCountOfBegining) % maxColumn;
        
        CGFloat origin_x = 10 + imageWidth * column + 10 * column;
        CGFloat origin_y = beginOriginY + imageWidth * row + 10 * row;
        
        CGRect rect = CGRectZero;
        rect = CGRectMake(origin_x, origin_y, imageWidth, imageWidth);
        [images[i] drawInRect:rect];
    }
}

+ (CGFloat)generateImageWidthWithImageCount:(NSInteger)count withWidth:(CGFloat)width{
    CGFloat sideLength = 0.0f;
    
    if (count >=2 && count <=4) {
        sideLength = (width - 10 * 3) / 2;
    } else {
        sideLength = (width - 10 * 4) / 3;
    }
    return sideLength;
}


@end
