//
//  NSDecimalNumber+LX.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (LX)

// NSDecimalNumber 高精度国际货币计算

/// 加法
/// @param first 第一位
/// @param end 第二位
+ (NSString *)lx_additionWithOne:(NSString *)first withEnd:(NSString *)end;

/// 减法
/// @param first 第一位
/// @param end 第二位
+ (NSString *)lx_subtractionWithOne:(NSString *)first withEnd:(NSString *)end;

/// 乘法
/// @param first 第一位
/// @param end 第二位
+ (NSString *)lx_multiplicationWithOne:(NSString *)first withEnd:(NSString *)end;

/// 除法  （处理了余数为0）
/// @param first 第一位
/// @param end 第二位
+ (NSString *)lx_divisionWithOne:(NSString *)first withEnd:(NSString *)end;

@end

NS_ASSUME_NONNULL_END
