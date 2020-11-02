//
//  UIImageView+LX.m
//  LXShare
//
//  Created by 卢旭 on 2020/10/19.
//

#import "UIImageView+LX.h"

@implementation UIImageView (LX)

+ (UIImageView *)lx_initWithImageName:(NSString * _Nullable)iconName{
    
    UIImageView *icon = [[UIImageView alloc]init];
    if (iconName.length) {
        icon.image = [UIImage imageNamed:iconName];
    }
    return icon;
}
@end
