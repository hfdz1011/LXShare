//
//  LXAppDelegate.m
//  LXShare
//
//  Created by hfdz1011 on 07/17/2020.
//  Copyright (c) 2020 hfdz1011. All rights reserved.
//

#import "LX_AppDelegate.h"
#import "LXMangerHeader.h"
#import "LXTestViewController.h"

@implementation LX_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LXUMShareConfigManger *um = [LXUMShareConfigManger sharedInstance];
    um.umAppKey = @"124";
    
    NSLog(@"输出内容为：%@\n",um.umAppKey);
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[LXTestViewController new]];
    
    [self.window makeKeyAndVisible];
            
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
