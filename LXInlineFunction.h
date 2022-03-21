//
//  LXInlineFunction.h
//  Pods
//
//  Created by 卢旭 on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXInlineFunction : NSObject

/// lx_prevent_flash_back 防止闪退
void lx_prevent_flash_back(NSException *exception)
{
    [[NSRunLoop currentRunLoop] run];
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
}

@end

NS_ASSUME_NONNULL_END
