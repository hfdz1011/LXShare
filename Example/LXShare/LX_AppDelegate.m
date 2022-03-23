//
//  LXAppDelegate.m
//  LXShare
//
//  Created by hfdz1011 on 07/17/2020.
//  Copyright (c) 2020 hfdz1011. All rights reserved.
//

#import "LX_AppDelegate.h"
#import "LXViewController.h"
#import "LXMangerHeader.h"

@implementation LX_AppDelegate

static inline void Prevent_App_Flashback(NSException *exception)
{
    //防止APP闪退
    [[NSRunLoop currentRunLoop] run];
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LXUMShareConfigManger *um = [LXUMShareConfigManger sharedInstance];
    um.umAppKey = @"124";
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSLog(@"输出内容为：%@\n",um.umAppKey);
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[LXViewController new]];
    
    [self.window makeKeyAndVisible];
    
    NSSetUncaughtExceptionHandler(Prevent_App_Flashback);
        
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
