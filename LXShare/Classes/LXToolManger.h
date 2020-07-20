//
//  LXToolManger.h
//  LXShare_Example
//
//  Created by Song on 2020/7/20.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>

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

/// json字符串转为字典
/// @param jsonString json字符串
+ (NSDictionary *)lx_dictoryFormJsonString:(NSString *)jsonString;

/// 给视图添加渐变颜色
/// @param frame frame
/// @param colors 颜色数组
/// @param locations 渐变节点位置 0～1
/// @param spoint 开始点位置
/// @param epoint 结束点位置
+ (CAGradientLayer *)lx_backGradientLayerFrame:(CGRect)frame withColorArray:(NSArray *)colors withLocations:(NSArray *)locations withStartPoint:(CGPoint )spoint withEndPoint:(CGPoint) epoint;

/// 返回APP本地的版本号
+ (NSString *)lx_localVersion;

/// 检查是否更新APP
/// @param localVersion 本地版本
/// @param storeVersion 服务器/App Store版本
+ (BOOL)lx_checkUpdateAppLocakVersion:(NSString *)localVersion withAppStoreVersion:(NSString *)storeVersion;

@end

NS_ASSUME_NONNULL_END
