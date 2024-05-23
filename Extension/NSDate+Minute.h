//
//  NSDate+Minute.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Minute)


+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;

+ (NSArray *)getAllBookTimeArrayWithMinimumInterval:(NSInteger)minInterval;

+ (NSString *)getCurrentBookDateTime;

+ (NSString *)getEndBookDateTimeWithStartTime:(NSString *)startTime;

+ (NSString *)getCurrentDateString;
+(NSDate *)xh_dateWithFormat_yyyy_MM_dd_string:(NSString *)string;
+(NSString *)xh_dateWithFormat_yyyy_MM_dd_date:(NSDate *)date;
+(NSDate *)xh_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string;
+(NSString *)xh_dateWithFormat_yyyy_MM_dd_HH_date:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
