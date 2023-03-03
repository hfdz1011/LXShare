//
//  LXToolManger.m
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import "LXToolManger.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "DateTools.h"

@implementation LXToolManger
/// 保存值
/// @param value 值
/// @param key 键
+ (void)lx_saveUserDefaultsWithValue:(NSString *)value forKey:(NSString *) key
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

/// 删除值
/// @param key 键
+ (void)lx_reMoveUserDefaultsForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

/// 获取值
/// @param key 键
+ (NSString *)lx_getUserDefaultsValueForKey:(NSString *)key
{
    return [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

/// 隐藏手机号中间数字
/// @param phoneString 手机号
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

/// 检查银行卡是否合法
/// @param cardNumber 银行卡号
+ (BOOL)lx_checkCardNumber:(NSString *)cardNumber
{
    NSString *digitsOnly = [self getDigitsOnly:cardNumber];
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (int i = (int)(digitsOnly.length - 1); i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
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
    for (int  i = 0; i < s.length; i++) {
        c = [s characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    return digitsOnly;
}

/// 数组转化为json字符串
/// @param array 数组
+ (NSString *)lx_jsonStringFormArray:(NSArray*)array
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) {
        return nil;
    }
    NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

/// json字符串转化为数组
/// @param json 字符串
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

/// 字典转化为json字符串
/// @param dictory 字典
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

/// 字典转化为json字符串 允许空格
/// @param dictory 字典
+ (NSString *)lx_jsonStringForm_Dictory:(NSDictionary *)dictory
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictory options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

/// json字符串转化为字典
/// @param jsonString 字符串
+ (NSDictionary *)lx_dictoryFormJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers  error:&err];
    if(err) {
        return nil;
    }
    return dic;
}

/// 给视图添加渐变颜色
/// @param frame frame
/// @param colors 颜色数组
/// @param locations 渐变节点位置 0～1
/// @param spoint 开始点位置
/// @param epoint 结束点位置
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

/// 根据文本内容返回二维码
/// @param message 文本内容
/// @param logoIconName logo图片名称
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
    if (b>0){
        c = a+1;
    }
    else {
        c = a;
    }
    for (int i = 0 ; i<c; i++) {
        NSString *string = @"";
        
        if (i == (c-1)) {
            if (b>0) {
                string = [cardNumber substringWithRange:NSMakeRange(4*(c-1), b)];
            }
            else{
                string = [cardNumber substringWithRange:NSMakeRange(4*i, 4)];
            }
            
        } else {
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
+ (void)lx_addCornerWithRoundedRect:(CGRect)rect RoundingCorners:(UIRectCorner)corners
                        cornerRadii:(CGSize)cornerRadii  roundView:(UIView *)roundView
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


/// 压缩图片
/// @param image 需要被压缩的图片
/// @param maxLength 压缩到的大小 500*1024 = 500KB
+(NSData *)lx_compressWithImage:(UIImage*)image imageKB:(NSUInteger)maxLength
{
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    return data;
}

/// 给钱千位分隔符
/// @param money 钱
/// @param isBool 是否带￥
+ (NSString *)lx_changeMoneyComma:(id)money isAndDecimal:(BOOL)isBool
{
    NSString *moneyStr = [LXToolManger lx_decimalNumberWithDouble:[NSString stringWithFormat:@"%@",money]];
    if([moneyStr doubleValue] <= 0 || money == nil){
        if (isBool) {
            return @"¥0.00";
        }
        return @"0.00";
    }
    NSNumber *moneyNumber = [NSNumber numberWithDouble:[moneyStr doubleValue]];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.positiveFormat = @"###,##0.00";
    [numberFormatter setRoundingMode:NSNumberFormatterRoundDown];
    NSString *formatString = [numberFormatter stringFromNumber:moneyNumber];
    if (isBool) {
        formatString = [NSString stringWithFormat:@"¥%@",formatString];
    }
    return formatString;
}

/// 获取随机数
/// @param kNumber 长度
+ (NSString *)lx_generateTradeNumberWithCount:(NSInteger)kNumber
{
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++){
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

/// 获取毫秒时间戳
+(NSString *)lx_getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // 设置想要的格式，hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这一点对时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timeSp;
}

/**
 * 加密方式,MAC算法: HmacSHA256
 *  @param secret       秘钥
 *  @param content 要加密的文本
 *  @return 加密后的字符串
 */
+ (NSString *)lx_hmacSHA256WithSecret:(NSString *)secret content:(NSString *)content
{
    const char *cKey  = [secret cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [content cStringUsingEncoding:NSUTF8StringEncoding];// 有可能有中文 所以用NSUTF8StringEncoding -> NSASCIIStringEncoding
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
    const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
    NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
    for (int i = 0; i < HMACData.length; ++i){
        [HMAC appendFormat:@"%02x", buffer[i]];
    }
    return HMAC;
}

/// sha1加密处理
/// @param str 需要处理的字符串
+(NSString*)lx_sha1WithStr:(NSString *)str
{
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length: strlen(cstr)];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, [[NSString stringWithFormat:@"%lu",(unsigned long)data.length] intValue], digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

/// 加密参数整理
/// @param dictory 参数数组
/// @param firstSpace 键值拼接符号 如：： 对应值 key:value
/// @param lastSpace 值与值拼接符号 如：& 对应值 key:value&key:value
+ (NSString *)lx_encryptionParameterSortingWithDictory:(NSMutableDictionary *)dictory keySpaceValue:(NSString *)firstSpace valueSpaceValue:(NSString *)lastSpace
{
    NSArray *sortedArray = [[dictory allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    NSString *stringA;
    for (int i=0; i<sortedArray.count; i++) {
        if (i==0) {
            stringA=[NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"\"",sortedArray[i],@"\"",@"\"",firstSpace,dictory[sortedArray[i]],@"\""];
        }else{
            stringA=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",stringA,lastSpace,@"\"",sortedArray[i],@"\"",@"\"",firstSpace,dictory[sortedArray[i]],@"\""];
        }
    }
    return [NSString stringWithFormat:@"%@%@%@",@"{",stringA,@"}"];
}
/// 返回缩放对应的高度
/// @param oldWidth 原宽度
/// @param oldHeight 原高度
/// @param newWidth 新宽度
+ (CGFloat)lx_backChangeHeightActionWithOldWidth:(CGFloat)oldWidth withOldHeight:(CGFloat)oldHeight withNewWidth:(CGFloat)newWidth
{
    CGFloat itemWidth = newWidth;
    CGFloat image_width = oldWidth;
    CGFloat image_height = oldHeight;
    CGFloat change_image_Height = itemWidth*image_height/image_width;
    return change_image_Height;
}
/// 返回缩放对应的宽度
/// @param oldWidth 原宽度
/// @param oldHeight 原高度
/// @param newHeight 新高度
+ (CGFloat)lx_backChangeWidthActionWithOldWidth:(CGFloat)oldWidth withOldHeight:(CGFloat)oldHeight withNewHeight:(CGFloat)newHeight
{
    CGFloat itemHeight = newHeight;
    CGFloat image_width = oldWidth;
    CGFloat image_height = oldHeight;
    CGFloat change_image_Width = itemHeight*image_width/image_height;
    return change_image_Width;
}

/// UIColor转化为UIImage
/// @param color 颜色
+ (UIImage *)lx_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启图片上下文
    UIGraphicsBeginImageContext(rect.size);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //设置rect
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //上下文使用完毕,关闭上下文
    UIGraphicsEndImageContext();
    //返回image
    return image;
}

/// 计算文本的高度或者宽度
/// @param string 文本字符串
/// @param stringFont 文本字体
/// @param widths 宽度 如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
/// @param heights 高度 如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
+ (CGSize)lx_calculationString:(NSString *)string withFont:(UIFont *)stringFont withWidth:(CGFloat)widths withHeight:(CGFloat)heights
{
    if (widths == MAXFLOAT || widths == CGFLOAT_MAX || widths == 0) {
        return  [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, heights)
                                           options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName: stringFont}
                                           context:nil].size;
   
    } else if (heights == MAXFLOAT || heights == CGFLOAT_MAX || heights == 0) {
      
        return  [string boundingRectWithSize:CGSizeMake(widths, CGFLOAT_MAX)
                                           options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName: stringFont}
                                           context:nil].size;
    }else{
        return CGSizeMake(0, 0);
    }
}

/// 登录设备是否是iPhoneX以上
+(BOOL)lx_isIphoneXAbove
{
    if (@available(iOS 11.0, *)) {
        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
        if (window.safeAreaInsets.bottom > 0.0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

/// 返回APP名称
+ (NSString *)lx_backAPPName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDisplayName"];
}


+ (NSDate *)timeStringToDate:(NSString *)timeString withType:(NSInteger)timeType
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (timeType) {
        case 0:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case 1:
            [dateFormatter setDateFormat:@"yyyyMMddHHmmssSSS"];
            break;
        case 2:
            [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
            break;
        case 3:
            [dateFormatter setDateFormat:@"yyyyMMdd"];
            break;
        case 4:
            [dateFormatter setDateFormat:@"yyyyMM"];
            break;
        case 5:
            [dateFormatter setDateFormat:@"yyyy-MM"];
            break;
        default:
            break;
    }
    return [dateFormatter dateFromString:timeString];
}

+ (NSString *)dateToTimeString:(NSDate *)date withType:(NSInteger)timeType
{
    NSString *lastString = @"";
    switch (timeType) {
        case 0:
            lastString = [NSString stringWithFormat:@"%ld.%02ld.%02ld",(long)date.year,date.month,date.day];
            break;
        case 1:
            lastString = [NSString stringWithFormat:@"%ld-%02ld-%02ld",(long)date.year,date.month,date.day];
            break;
        case 2:
            lastString = [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",(long)date.year,date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        case 3:
            lastString = [NSString stringWithFormat:@"%ld年%02ld月%02ld日",(long)date.year,date.month,date.day];
            break;
        case 4:
            lastString = [NSString stringWithFormat:@"%ld-%02ld-%02ld 00:00:00",(long)date.year,date.month,date.day];
            break;
        case 5:
            lastString = [NSString stringWithFormat:@"%ld-%02ld-%02ld 23:59:59",(long)date.year,date.month,date.day];
            break;
        case 6:
            lastString = [NSString stringWithFormat:@"%ld%02ld%02ld%02ld%02ld%02ld",(long)date.year,date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        case 7:
            lastString = [NSString stringWithFormat:@"%02ld:%02ld",(long)date.hour,date.minute];
            break;
        case 8:
            lastString = [NSString stringWithFormat:@"%ld年%02ld月",(long)date.year,date.month];
            break;
        case 9:
            lastString = [NSString stringWithFormat:@"%ld.%02ld",(long)date.year,date.month];
            break;
        case 10:
            lastString = [NSString stringWithFormat:@"%02ld-%02ld",(long)date.month,date.day];
            break;
        case 11:
            lastString = [NSString stringWithFormat:@"%ld-%02ld",(long)date.year,date.month];
            break;
        case 12:
            lastString = [NSString stringWithFormat:@"%ld.%02ld.%02ld %02ld:%02ld:%02ld",(long)date.year,date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        case 13:
            lastString = [NSString stringWithFormat:@"%ld/%02ld/%02ld",(long)date.year,(long)date.month,date.day];
            break;
        case 14:
            lastString = [NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld:%02ld",date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        case 15:
            lastString = [NSString stringWithFormat:@"%ld%02ld%02ld000000",(long)date.year,date.month,date.day];
            break;
        case 16:
            lastString = [NSString stringWithFormat:@"%ld%02ld%02ld235959",(long)date.year,date.month,date.day];
            break;
        case 17:
            lastString = [NSString stringWithFormat:@"%ld.%02ld.%02ld %02ld:%02ld:%02ld",(long)date.year,date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        case 18:
            lastString = [NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld:%02ld",date.month,date.day,(long)date.hour,date.minute,date.second];
            break;
        default:
            break;
    }
    return lastString;
}



+ (NSString *)lx_timeString:(NSString *)times TimeType:(NSInteger) timeType backTimeType:(NSInteger)backType
{
    return [LXToolManger dateToTimeString:[LXToolManger timeStringToDate:times withType:timeType] withType:backType];
}


+ (NSInteger)lx_backWeekDay:(NSDate *)date
{
    NSInteger weekday = date.weekday;
    int index = 0;
    switch (weekday) {
        case 1://星期天
            index = 6;
            break;
        case 2://星期一
            index = 0;
            break;
        case 3://星期二
            index = 1;
            break;
        case 4://星期三
            index = 2;
            break;
        case 5://星期四
            index = 3;
            break;
        case 6://星期五
            index = 4;
            break;
        case 7://星期六
            index = 5;
            break;
        default:
            break;
    }
    return index;
}



@end
