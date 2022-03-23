//
//  LXUMShareConfigManger.m
//  Pods
//
//  Created by 万商通 on 2022/3/23.
//

#import "LXUMShareConfigManger.h"

static LXUMShareConfigManger *manger = nil;

@implementation LXUMShareConfigManger

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger =[[LXUMShareConfigManger alloc]init];
    });
    return manger;
}

+(id)allocWithZone:(NSZone *)zone{
    
    if (manger == nil) {
        manger = [super allocWithZone:zone];
    }
    return manger;
}

-(id)copyWithZone:(NSZone *)zone{
    return manger;
}

+ (void)cleanUserInfor{
    manger = nil;
}


@end
