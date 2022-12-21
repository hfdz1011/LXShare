//
//  LXTimeConfig.h
//  Pods
//
//  Created by 卢旭 on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXTimeConfig : NSObject

/// 返回格式化时间
/// @param timeType 时间类型 【0 ： 2022年03月01日  1:2022.03.01 2:2022-03-01 3:2022～03～01 4:2022:03:01 08:00:00  】
/// @param time 时间/时间戳
+ (NSString *)lx_returnTimeFormatType:(NSInteger)timeType timeValue:(id)time;

@end

NS_ASSUME_NONNULL_END
