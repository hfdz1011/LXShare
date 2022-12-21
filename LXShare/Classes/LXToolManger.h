//
//  LXToolManger.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LXToolManger : NSObject

/// UserDefault存储
/// @param value 需要保存的值
/// @param key 存储对应的Key值
+ (void)lx_saveUserDefaultsWithValue:(NSString *)value forKey:(NSString *) key;

/// UserDefault 移除
/// @param key 根据Key移除对应的存储值
+ (void)lx_reMoveUserDefaultsForKey:(NSString *)key;

/// UserDefault 取值
/// @param key 根据KEY获取存储的值
+ (NSString *)lx_getUserDefaultsValueForKey:(NSString *)key;

/// 隐藏手机号的中间项
/// @param phoneString 手机号
+ (NSString *)lx_hidenCenterPhoneNumber:(NSString *)phoneString;

/// 检查银行卡号的合法性
/// @param cardNumber 银行卡号
+ (BOOL)lx_checkCardNumber:(NSString *)cardNumber;

/// 数组转化json字符串
/// @param array 数组
+ (NSString *)lx_jsonStringFormArray:(NSArray*)array;

/// json字符串转数组
/// @param json json字符串
+ (NSMutableArray *)lx_arrayFormJsonString:(NSString *)json;

/// 字典转化json字符串
/// @param dictory 字典
+ (NSString *)lx_jsonStringFormDictory:(NSDictionary *)dictory;

///字典转化为json字符串 允许空格
+ (NSString *)lx_jsonStringForm_Dictory:(NSDictionary *)dictory;

/// json字符串转为字典
/// @param jsonString json字符串
+ (NSDictionary *)lx_dictoryFormJsonString:(NSString *)jsonString;

/// 给视图添加渐变颜色
/// @param frame frame
/// @param colors 颜色数组
/// @param locations 渐变节点位置 0～1
/// @param spoint 开始点位置
/// @param epoint 结束点位置
+ (CAGradientLayer *)lx_backGradientLayerFrame:(CGRect)frame withColorArray:(NSArray *)colors
                                 withLocations:(NSArray *)locations withStartPoint:(CGPoint )spoint
                                  withEndPoint:(CGPoint) epoint;
/// 根据文本内容返回二维码
/// @param message 文本内容
/// @param logoIconName logo图片名称
+ (UIImage *)lx_returnQrCodeImageForMessage:(NSString *)message withLogoImageName:(NSString * _Nullable) logoIconName;

/// 视图抖动
/// @param view 视图
+ (void)lx_popViewAction:(UIView *)view;

/// 返回APP本地的版本号
+ (NSString *)lx_localVersion;

/// 检查是否更新APP
/// @param localVersion 本地版本
/// @param storeVersion 服务器/App Store版本
+ (BOOL)lx_checkUpdateAppLocakVersion:(NSString *)localVersion withAppStoreVersion:(NSString *)storeVersion;

///精度参数的处理
+ (NSString *)lx_decimalNumberWithDouble:(NSString *)changeString;
/// 银行卡号间隔
/// @param cardNumber 银行卡号
+ (NSString *)lx_backBankCardNumberIntervalWithNumber:(NSString *)cardNumber;

/// 给控件添加部分圆角
/// @param rect 控件的rect
/// @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
/// @param cornerRadii 需要设置的圆角大小 CGSize
/// @param roundView 需要设置圆角的控件
+ (void)lx_addCornerWithRoundedRect:(CGRect)rect RoundingCorners:(UIRectCorner)corners
                     cornerRadii:(CGSize)cornerRadii roundView:(UIView *)roundView;
/// base64转文字
/// @param base64String base64字符
+ (NSString *)lx_base64ToJsonString:(NSString *)base64String;

/// 压缩图片
/// @param image 需要被压缩的图片
/// @param maxLength 压缩到的大小 500*1024 = 500KB
+(NSData *)lx_compressWithImage:(UIImage*)image imageKB:(NSUInteger)maxLength;

/// 给钱千位分隔符
/// @param money 钱
/// @param isBool 是否带￥
+ (NSString *)lx_changeMoneyComma:(id)money isAndDecimal:(BOOL)isBool;

/// 获取随机数
/// @param kNumber 长度
+ (NSString *)lx_generateTradeNumberWithCount:(NSInteger)kNumber;

/// 获取毫秒时间戳
+(NSString *)lx_getNowTimeTimestamp;

/**
 * 加密方式,MAC算法: HmacSHA256
 *  @param secret       秘钥
 *  @param content 要加密的文本
 *  @return 加密后的字符串
 */

+ (NSString *)lx_hmacSHA256WithSecret:(NSString *)secret content:(NSString *)content;

/// sha1加密处理
/// @param str 需要处理的字符串
+(NSString*)lx_sha1WithStr:(NSString *)str;

/// 加密参数整理
/// @param dictory 参数数组
/// @param firstSpace 键值拼接符号 如：： 对应值 key:value
/// @param lastSpace 值与值拼接符号 如：& 对应值 key:value&key:value
+ (NSString *)lx_encryptionParameterSortingWithDictory:(NSMutableDictionary *)dictory keySpaceValue:(NSString *)firstSpace
                                       valueSpaceValue:(NSString *)lastSpace;

/// 返回缩放对应的高度
/// @param oldWidth 原宽度
/// @param oldHeight 原高度
/// @param newWidth 新宽度
+ (CGFloat)lx_backChangeHeightActionWithOldWidth:(CGFloat)oldWidth withOldHeight:(CGFloat)oldHeight withNewWidth:(CGFloat)newWidth;

/// 返回缩放对应的宽度
/// @param oldWidth 原宽度
/// @param oldHeight 原高度
/// @param newHeight 新高度
+ (CGFloat)lx_backChangeWidthActionWithOldWidth:(CGFloat)oldWidth withOldHeight:(CGFloat)oldHeight withNewHeight:(CGFloat)newHeight;

/// UIColor转化为UIImage
/// @param color 颜色
+ (UIImage *)lx_imageWithColor:(UIColor *)color;

/// 计算文本的高度或者宽度
/// @param string 文本字符串
/// @param stringFont 文本字体
/// @param widths 宽度 如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
/// @param heights 高度 如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
+ (CGSize)lx_calculationString:(NSString *)string withFont:(UIFont *)stringFont withWidth:(CGFloat)widths withHeight:(CGFloat)heights;

/// 登录设备是否是iPhoneX以上
+(BOOL)lx_isIphoneXAbove;

/// 返回APP名称
+ (NSString *)lx_backAPPName;
@end

NS_ASSUME_NONNULL_END
