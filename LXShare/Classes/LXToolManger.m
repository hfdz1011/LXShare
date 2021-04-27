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

///保存值
+ (void)lx_saveUserDefaultsWithValue:(NSString *)value forKey:(NSString *) key
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
///删除值
+ (void)lx_reMoveUserDefaultsForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
///获取值
+ (NSString *)lx_getUserDefaultsValueForKey:(NSString *)key
{
    return [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}
///隐藏手机号中间数字
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

///检查银行卡是否合法
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

///剔除卡号里的非法字符
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
///数组转化为json字符串
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
///json字符串转化为数组
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
///字典转化为json字符串
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
///json字符串转化为字典
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
///添加渐变效果
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

///根据文本内容返回二维码【可添加logo】
+ (UIImage *)lx_returnQrCodeImageForMessage:(NSString *)message withLogoImageName:(NSString * _Nullable) logoIconName
{
    
    CIFilter *qrImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrImageFilter setDefaults];
    
    NSData *qrImageData = [message dataUsingEncoding:NSUTF8StringEncoding];
    [qrImageFilter setValue:qrImageData forKey:@"inputMessage"];
    
    //取出图片
    CIImage *qrImage = [qrImageFilter outputImage];
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    //转成 UI的 类型
    UIImage *qrUIImage = [UIImage imageWithCIImage:qrImage];
    UIGraphicsBeginImageContext(qrUIImage.size);
    [qrUIImage drawInRect:CGRectMake(0, 0, qrUIImage.size.width, qrUIImage.size.height)];
    
    if (logoIconName.length) {
        
        //再把小图片画上去
        UIImage *sImage = [UIImage imageNamed:logoIconName];
        CGFloat sImageW = 140;
        CGFloat sImageH = sImageW;
        CGFloat sImageX = (qrUIImage.size.width - sImageW) * 0.5;
        CGFloat sImgaeY = (qrUIImage.size.height - sImageH) * 0.5;
        [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    }
    
    //获取当前画得的这张图片
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return finalyImage;
}
///为视图添加抖动效果
+ (void)lx_popViewAction:(UIView *)view
{
    @autoreleasepool {
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
        CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
        CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
        CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
        
        NSArray *frameValues = [NSArray arrayWithObjects:
                                [NSValue valueWithCATransform3D:scale1],
                                [NSValue valueWithCATransform3D:scale2],
                                [NSValue valueWithCATransform3D:scale3],
                                [NSValue valueWithCATransform3D:scale4],
                                nil];
        
        [animation setValues:frameValues];
        
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.5],
                               [NSNumber numberWithFloat:0.9],
                               [NSNumber numberWithFloat:1.0],
                               nil];
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        animation.duration = 0.3f;
        
        [view.layer addAnimation:animation forKey:@"DSPopUpAnimation"];
    }
}

//------------------------------APP----------------------------
///获取本地版本号信息
+ (NSString *)lx_localVersion
{
    return  [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}
///判断是否更新应用
+ (BOOL)lx_checkUpdateAppLocakVersion:(NSString *)localVersion withAppStoreVersion:(NSString *)storeVersion
{
    
    if (([localVersion compare:storeVersion options:NSNumericSearch] == NSOrderedAscending)){
        
        return YES;
        
    }else{
        return NO;
    }
    
}

//~~~~~~~~

///精度参数的处理 -解决解析float或double 精度异常
+ (NSString *)lx_decimalNumberWithDouble:(NSString *)changeString
{
    
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", [changeString doubleValue]];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
    
}

/// 银行卡号间隔
/// @param cardNumber 银行卡号
+ (NSString *)lx_backBankCardNumberIntervalWithNumber:(NSString *)cardNumber
{
    NSString *getString = @"";
    
    int a = (int)cardNumber.length/4;
    int b = (int)cardNumber.length%4;
    int c = a;
    if (b>0)
    {
        c = a+1;
    }
    else
    {
        c = a;
    }
    for (int i = 0 ; i<c; i++)
    {
        NSString *string = @"";
        
        if (i == (c-1))
        {
            if (b>0)
            {
                string = [cardNumber substringWithRange:NSMakeRange(4*(c-1), b)];
            }
            else
            {
                string = [cardNumber substringWithRange:NSMakeRange(4*i, 4)];
            }
            
        }
        else
        {
            string = [cardNumber substringWithRange:NSMakeRange(4*i, 4)];
        }
        getString = [NSString stringWithFormat:@"%@ %@",getString,string];
    }
    return getString;
    
}

/** 给控件添加部分圆角
 * @param rect 控件的rect
 * @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 * @param cornerRadii 需要设置的圆角大小 CGSize
 * @param roundView 需要设置圆角的控件
 **/
+ (void)lx_addCornerWithRoundedRect:(CGRect)rect
                 RoundingCorners:(UIRectCorner)corners
                     cornerRadii:(CGSize)cornerRadii
                       roundView:(UIView *)roundView
{
    [roundView layoutIfNeeded];
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    roundView.layer.mask = shape;
}
/// base64转文字
/// @param base64String base64字符
+ (NSString *)lx_base64ToJsonString:(NSString *)base64String
{
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64String
                                                       options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}

@end
