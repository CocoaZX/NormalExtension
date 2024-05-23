//
//  NSDate+Extension.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)

//返回2018-11-20格式字符串
- (NSString *)dateString;

//传入格式
- (NSString *)dateStringWithFormat:(NSString *)fmt;

//返回 h:mm 这种时间字符串
- (NSString *)timeString;

//返回 hh:mm 这种时间字符串
- (NSString *)timeStringFromDate;

//返回yyyy-MM-dd'T'HH:mm:ss格式字符串
- (NSString *)dateTimeString;

- (NSString *)dateTimeSecondString;
- (NSString *)dateTimeSecondSSSString;

//字符串转date，字符串需要是yyyy-MM-dd格式
+ (NSDate *)dateFromString:(NSString *)string;



//yyyy-MM-dd'T'HH:mm:ss格式
+ (NSDate *)datetimeFromString:(NSString *)string;

//yyyy-MM-dd HH:mm格式
+ (NSDate *)dateTimeFromDateTimeString:(NSString *)string;

//HH:mm格式
+ (NSDate *)timeFromString:(NSString *)string;

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)fmt;

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;

@end

NS_ASSUME_NONNULL_END
