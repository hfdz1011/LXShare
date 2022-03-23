//
//  LXUMShareConfigManger.h
//  Pods
//
//  Created by 万商通 on 2022/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXUMShareConfigManger : NSObject

+ (LXUMShareConfigManger *)sharedInstance;

//个推配置
@property (strong, nonatomic) NSString *umAppKey;
@property (strong, nonatomic) NSString *jiaGTAppKey;
@property (strong, nonatomic) NSString *jiaGTAppSecret;

@end

NS_ASSUME_NONNULL_END
