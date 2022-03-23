//
//  XAspect-LXAppDelegate.m
//  Pods
//
//  Created by 万商通 on 2022/3/23.
//

#import <Foundation/Foundation.h>
#import "LXAppDelegate.h"
#import "XAspect.h"
#import "LXUMShareConfigManger.h"

/**
 必须要有的宏定义, 而且必须写在最前面
 @param AtAspect: 字段固定, 不能修改
 @param LZProjectName: 这个可以自定义, 一般和自己需要注入代码的类有关
*/
#define AtAspect LogAppDelegate

/**
 需要注入代码的类
 @param AtAspectOfClass: 固定字段, 不能修改
 @param AppDelegate: 需要注入代码的类
 */
#define AtAspectOfClass LXAppDelegate
// 开辟空间, 这个参数类名需和上面的类一致
@classPatchField(LXAppDelegate)

/**
 需要添加的方法
 @param - 方法类型: - 实例方法; + 类方法
 @param BOOL 返回值类型
 @param UIApplication 方法实体
 @return 返回
 */
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
