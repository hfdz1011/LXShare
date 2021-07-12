//
//  LXAppDelegate.m
//  LXShare
//
//  Created by hfdz1011 on 07/17/2020.
//  Copyright (c) 2020 hfdz1011. All rights reserved.
//

#import "LXAppDelegate.h"
#import "LXViewController.h"
#import "LXMangerHeader.h"

@implementation LXAppDelegate

static inline void Prevent_App_Flashback(NSException *exception)
{
    //防止APP闪退
    [[NSRunLoop currentRunLoop] run];
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [LXViewController new];
    
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
