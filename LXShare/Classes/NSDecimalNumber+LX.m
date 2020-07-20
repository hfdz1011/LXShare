//
//  NSDecimalNumber+LX.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "NSDecimalNumber+LX.h"

@implementation NSDecimalNumber (LX)

//加
+ (NSString *)lx_additionWithOne:(NSString *)first withEnd:(NSString *)end{
    NSDecimalNumber *jiafa1 = [NSDecimalNumber decimalNumberWithString:first];
    NSDecimalNumber *jiafa2 = [NSDecimalNumber decimalNumberWithString:end];
    NSDecimalNumber *jiafa = [jiafa1 decimalNumberByAdding:jiafa2];
    return [NSString stringWithFormat:@"%@",jiafa];
}
//减
+ (NSString *)lx_subtractionWithOne:(NSString *)first withEnd:(NSString *)end{
    NSDecimalNumber *jianfa1 = [NSDecimalNumber decimalNumberWithString:first];
    NSDecimalNumber *jianfa2 = [NSDecimalNumber decimalNumberWithString:end];
    NSDecimalNumber *jianfa = [jianfa1 decimalNumberBySubtracting:jianfa2];
    return [NSString stringWithFormat:@"%@",jianfa];
}
//乘
+ (NSString *)lx_multiplicationWithOne:(NSString *)first withEnd:(NSString *)end{
    NSDecimalNumber *chengfa1 = [NSDecimalNumber decimalNumberWithString:first];
    NSDecimalNumber *chengfa2 = [NSDecimalNumber decimalNumberWithString:end];
    NSDecimalNumber *chengfa = [chengfa1 decimalNumberByMultiplyingBy:chengfa2];
    return [NSString stringWithFormat:@"%@",chengfa];
}
//除
+ (NSString *)lx_divisionWithOne:(NSString *)first withEnd:(NSString *)end{
    if ([end floatValue] == 0) {
        return [NSString stringWithFormat:@"0"];
    }
    NSDecimalNumber *chufa1 = [NSDecimalNumber decimalNumberWithString:first];
    NSDecimalNumber *chufa2 = [NSDecimalNumber decimalNumberWithString:end];
    NSDecimalNumber *chufa = [chufa1 decimalNumberByDividingBy:chufa2];
    return [NSString stringWithFormat:@"%@",chufa];
}

@end
