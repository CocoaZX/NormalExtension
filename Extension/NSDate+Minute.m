//
//  NSDate+Minute.m
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import "NSDate+Minute.h"
#define kMinimumInterval 5    // 最小时间间隔（分钟）
#define kMinimumBookInterval  30  // 最小预定单位（分钟）
#define kMinimumYear 2015    // 日期选择器 最早年份
//#import <AppKit/AppKit.h>


@implementation NSDate (Minute)

// 时间差
+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"HH:mm"];
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

// 全部时间轴
+ (NSArray *)getAllBookTimeArrayWithMinimumInterval:(NSInteger)minInterval
{
    NSString *start = @"07:00";
    NSString *end = @"23:30";

    NSTimeInterval interval = [NSDate pleaseInsertStarTime:start andInsertEndTime:end];
    NSInteger count = interval/(60*minInterval);
    NSMutableArray *timeArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<count+1; i++) {
        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"HH:mm"];
        NSDate *startDate = [formater dateFromString:start];
        NSTimeInterval subInterval = 60*i*5;
        NSDate *date = [NSDate dateWithTimeInterval:subInterval sinceDate:startDate];
        NSString *curString = [formater stringFromDate:date];
        [timeArray addObject:curString];
    }
    return timeArray;
}

// 获取当前时间间隔5(可配置)分钟
+ (NSString *)getCurrentBookDateTime
{
    NSString *start = @"07:00";
    NSString *end = @"23:30";
    NSString *bookTime;
    NSArray *timeArray = [NSDate getAllBookTimeArrayWithMinimumInterval:kMinimumInterval];
    
    NSDate *date = [NSDate date];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"HH:mm"];
    NSString *curTime = [formater stringFromDate:date];
    NSInteger hour = [[[curTime componentsSeparatedByString:@":"] firstObject] integerValue];
    NSInteger min = [[[curTime componentsSeparatedByString:@":"] lastObject] integerValue];
    
    if (hour<7) {
        return start;
    } else {
        if (min>(60-kMinimumInterval)) {
            return [NSString stringWithFormat:@"%02ld:00",hour+1];
        }
        if (!min%kMinimumInterval) {
            return curTime;
        }
        NSInteger sub = min%kMinimumInterval;
        return [NSString stringWithFormat:@"%02ld:%02ld",hour,min+(kMinimumInterval-sub)];
    }
}

// 获取默认截止预定时间
+ (NSString *)getEndBookDateTimeWithStartTime:(NSString *)startTime
{
    NSInteger hour = [[[startTime componentsSeparatedByString:@":"] firstObject] integerValue];
    NSInteger min = [[[startTime componentsSeparatedByString:@":"] lastObject] integerValue];
    
    if (min+kMinimumBookInterval<60) {
        return [NSString stringWithFormat:@"%02ld:%02ld",hour,min+kMinimumBookInterval];
    } else {
        return [NSString stringWithFormat:@"%02ld:%02ld",hour+1,min+kMinimumBookInterval-60];
    }
}

+ (NSString *)getCurrentDateString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formater stringFromDate:[NSDate date]];
}

+(NSDate *)xh_dateWithFormat_yyyy_MM_dd_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    dateFormat.timeZone = [NSTimeZone localTimeZone];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}
+(NSString *)xh_dateWithFormat_yyyy_MM_dd_date:(NSDate *)date
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM dd, yyyy"];
    NSString *str = [dateFormat stringFromDate:date];
    return str;
}

+(NSDate *)xh_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormat.timeZone = [NSTimeZone localTimeZone];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}
+(NSString *)xh_dateWithFormat_yyyy_MM_dd_HH_date:(NSDate *)date
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM dd, yyyy HH:mm:ss"];
    NSString *str = [dateFormat stringFromDate:date];
    return str;
}

@end
