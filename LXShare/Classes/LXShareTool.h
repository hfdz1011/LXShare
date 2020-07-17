//
//  LXShareTool.h
//  LXShare_Example
//
//  Created by Song on 2020/7/17.
//  Copyright © 2020 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXShareTool : NSObject
// 隐藏手机号码 **
+ (NSString *)hidePhone:(NSString *)phone;


//检查银行卡是否合法
//Luhn算法
+ (BOOL)isValidCardNumber:(NSString *)cardNumber;


@end

NS_ASSUME_NONNULL_END
