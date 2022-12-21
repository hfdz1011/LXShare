//
//  LXTimeConfig.m
//  Pods
//
//  Created by 卢旭 on 2022/3/21.
//

#import "LXTimeConfig.h"
#import "DateTools.h"

@implementation LXTimeConfig

/// 返回格式化时间
/// @param timeType 时间类型 【0 ： 2022年03月01日  1:2022.03.01 2:2022-03-01 3:2022～03～01 4:2022:03:01 08:00:00  】
/// @param time 时间/时间戳
+ (NSString *)lx_returnTimeFormatType:(NSInteger)timeType timeValue:(id)time
{
    NSDate *changeDate ;
    if ([time isKindOfClass:[NSDate class]]) {
        changeDate = (NSDate *)time;
    }else{
        changeDate = [NSDate dateWithTimeIntervalSince1970:(long)time];
    }
    NSString *lastString;
    switch (timeType) {
        case 0:
            lastString = [NSString stringWithFormat:@"%ld年%02ld月%02ld日",(long)changeDate.year,changeDate.month,(long)changeDate.day];
            break;
        case 1:
            lastString = [NSString stringWithFormat:@"%ld.%02ld.%02ld",(long)changeDate.year,changeDate.month,(long)changeDate.day];
            break;
        case 2:
            lastString = [NSString stringWithFormat:@"%ld-%02ld-%02ld",(long)changeDate.year,changeDate.month,(long)changeDate.day];
            break;
        case 3:
            lastString = [NSString stringWithFormat:@"%ld~%02ld~%02ld",(long)changeDate.year,changeDate.month,(long)changeDate.day];
            break;
        case 4:
            lastString = [NSString stringWithFormat:@"%ld:%2ld:%lo2ld %02ld:%02ld:%02ld",(long)changeDate.year,changeDate.month,(long)changeDate.day, changeDate.hour,changeDate.minute,changeDate.second];
            break;
            
        default:
            lastString = [NSString stringWithFormat:@"%ld年%02ld月%02ld日",(long)changeDate.year,changeDate.month,(long)changeDate.day];
            break;
    }
    
    return lastString;
}

@end
