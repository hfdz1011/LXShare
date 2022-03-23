//
//  LXUMShareConfigManger.m
//  Pods
//
//  Created by 万商通 on 2022/3/23.
//

#import "LXUMShareConfigManger.h"

@implementation LXUMShareConfigManger

+ (LXUMShareConfigManger *)sharedInstance
{
    static LXUMShareConfigManger* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LXUMShareConfigManger new];
    });

    return instance;
}

@end
