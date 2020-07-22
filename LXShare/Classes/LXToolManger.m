//
//  LXToolManger.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "LXToolManger.h"
#import <UIKit/UIKit.h>
@implementation LXToolManger

+ (void)lx_saveUserDefaultsWithValue:(NSString *)value forKey:(NSString *) key
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (void)lx_reMoveUserDefaultsForKey:(NSString *)key
{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (NSString *)lx_getUserDefaultsValueForKey:(NSString *)key
{
    return [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

+ (NSString *)lx_hidenCenterPhoneNumber:(NSString *)phoneString
{
    NSString *phoneNew = [[NSString alloc] init];
    
    for (int i = 0; i < phoneString.length; i++) {
        
        NSString *str = [[NSString alloc] init];
        
        if (!(i > 2 && i < 7)) {
            
            str = [phoneString substringWithRange:NSMakeRange(i, 1)];
        }else{
            str = @"*";
        }
        phoneNew = [phoneNew stringByAppendingString:str];
    }
    
    return phoneNew;
    
}

//检查银行卡是否合法
+ (BOOL)lx_checkCardNumber:(NSString *)cardNumber
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

+ (NSString *)lx_jsonStringFormArray:(NSArray*)array
{
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    if (data == nil) {
        
        return nil;
        
    }
    NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return str;
}

+ (NSMutableArray *)lx_arrayFormJsonString:(NSString *)json
{
    
    NSMutableArray *arr = [NSMutableArray array];
    if (json) {
        id tmp = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                 options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers
                                                   error:nil];
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                
                return [tmp mutableCopy];
                
            } else if([tmp isKindOfClass:[NSString class]]
                      || [tmp isKindOfClass:[NSDictionary class]]) {
                
                return [[NSArray arrayWithObject:tmp]mutableCopy];
                
            } else {
                return arr;
            }
        } else {
            return arr;
        }
        
    } else {
        return arr;
    }
}

+ (NSString *)lx_jsonStringFormDictory:(NSDictionary *)dictory
{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictory options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

+ (NSDictionary *)lx_dictoryFormJsonString:(NSString *)jsonString
{
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        return nil;
    }
    return dic;
}

//========================================================

+ (CAGradientLayer *)lx_backGradientLayerFrame:(CGRect)frame withColorArray:(NSArray *)colors withLocations:(NSArray *)locations withStartPoint:(CGPoint )spoint withEndPoint:(CGPoint) epoint
{
    CAGradientLayer *layer =  [CAGradientLayer layer];
    layer = [CAGradientLayer layer];
    layer.frame = frame;
    
    NSMutableArray *colorArray = [NSMutableArray array];
    
    for (UIColor *color in colors) {
        [colorArray addObject:(__bridge id)color.CGColor];
    }
    layer.colors = colorArray;
    layer.locations = locations;
    
    layer.startPoint = spoint;
    layer.endPoint = epoint;
    
    return layer;
}

//------------------------------APP----------------------------

+ (NSString *)lx_localVersion
{
    return  [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+ (BOOL)lx_checkUpdateAppLocakVersion:(NSString *)localVersion withAppStoreVersion:(NSString *)storeVersion
{
    
    if (([localVersion compare:storeVersion options:NSNumericSearch] == NSOrderedAscending)){
               
        return YES;
            
    }else{
        return NO;
    }
    
}

//~~~~~~~~



@end
