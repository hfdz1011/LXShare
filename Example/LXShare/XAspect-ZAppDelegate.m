//
//  XAspect-LXAppDelegate.m
//  LXShare_Example
//
//  Created by 万商通 on 2022/3/24.
//  Copyright © 2022 hfdz1011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZAppDelegate.h"
#import "XAspect.h"
#import "LXUMShareConfigManger.h"

#define AtAspect AppDelegate
#define AtAspectOfClass ZAppDelegate
@classPatchField(ZAppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    //日志初始化
    NSLog(@"日志初始化");

    LXUMShareConfigManger *umManger = [LXUMShareConfigManger sharedInstance];
    if (umManger.umAppKey.length) {
        NSLog(@"开始注册");
        
    }else{
        NSLog(@"没有开启注册");
    }
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}
@end
#undef AtAspectOfClass
#undef AtAspect
