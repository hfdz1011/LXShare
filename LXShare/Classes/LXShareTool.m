//
//  LXShareTool.m
//  LXShare_Example
//
//  Created by Song on 2020/7/17.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "LXShareTool.h"

@implementation LXShareTool

// 隐藏手机号码 **
+ (NSString *)hidePhone:(NSString *)phone
{
    NSString *phoneNew = [[NSString alloc] init];
    
    for (int i = 0; i < phone.length; i++) {
        
        NSString *str = [[NSString alloc] init];
        
        if (!(i > 2 && i < 7)) {
            
            str = [phone substringWithRange:NSMakeRange(i, 1)];
        }else{
            str = @"*";
        }
        
        phoneNew = [phoneNew stringByAppendingString:str];
        
    }
    
    return phoneNew;
}


//检查银行卡是否合法
//Luhn算法
+ (BOOL)isValidCardNumber:(NSString *)cardNumber
{
    NSString *digitsOnly = [self getDigitsOnly:cardNumber];
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (int i = (int)(digitsOnly.length - 1); i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

//剔除卡号里的非法字符
+ (NSString *)getDigitsOnly:(NSString*)s
{
    NSString *digitsOnly = @"";
    char c;
    for (int  i = 0; i < s.length; i++)
    {
        c = [s characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    return digitsOnly;
}

@end
