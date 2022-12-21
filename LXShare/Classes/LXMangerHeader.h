//
//  LXMangerHeader.h
//  Pods
//
//  Created by Song on 2020/7/17.
//

#ifndef LXMangerHeader_h
#define LXMangerHeader_h

#import "LXToolManger.h"
#import "NSArray+LX.h"
#import "NSDecimalNumber+LX.h"
#import "NSDictionary+LX.h"
#import "NSMutableAttributedString+LX.h"
#import "UIAlertController+LX.h"
#import "UIColor+LX.h"
#import "UITextField+LX.h"
#import "UIButton+LX.h"
#import "UILabel+LX.h"
///时间配置
#import "LXTimeConfig.h"
#import "DateTools.h"
#import "Masonry.h"
#import "UIViewController+Navigation.h"

//======================config=================

#define K_Font_Regular   @"PingFangSC-Regular"
#define K_Font_Medium    @"PingFangSC-Medium"
#define K_Font_Light     @"PingFangSC-Light"
#define K_Font_Semibold  @"PingFangSC-Semibold"


#define KscrendWidth             [UIScreen mainScreen].bounds.size.width
#define KscrendHeight            [UIScreen mainScreen].bounds.size.height

#define KRealyHeight(value)    ((value) * [UIScreen mainScreen].bounds.size.width)/375

#define KStringIsEmpty(str)                ([str isKindOfClass:[NSNull class]] || [str isEqual: @"(null)"] || [str isEqual: @"<null>"] || [str isEqual: [NSNull null]] || str == nil || [str length] < 1 ? YES : NO )


#define rmStatusBarH ([UIApplication sharedApplication].statusBarFrame.size.height)//(44/20)
#define KDEVICE_IS_IPHONE_X ((rmStatusBarH > 20.0) ? YES : NO)

//状态栏、导航栏、标签栏高度
#define KHeight_StatusBar         [[UIApplication sharedApplication] statusBarFrame].size.height

#define KHeight_NavBar                      44.f

#define KNavigationBarHeight (KHeight_StatusBar + KHeight_NavBar)

#define KTabbarHeight                    (KDEVICE_IS_IPHONE_X ? 83.0f:49.0f)

#define KTabbarSafeBottomMargin          (KDEVICE_IS_IPHONE_X ? 34.0f:0.0f)

//控制台的完整的输出
#define CLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#endif /* LXMangerHeader_h */
