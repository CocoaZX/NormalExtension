//
//  NSDate+Extension.m
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString *)dateString {
    return [self dateStringWithFormat:@"yyyy-MM-dd"];
}

//传入格式
- (NSString *)dateStringWithFormat:(NSString *)fmt {
    if (self == nil) {
        return @"";
    }
    static NSDateFormatter *sDateFmt = nil;
    if (sDateFmt == nil) {
        sDateFmt = [[NSDateFormatter alloc] init];
        sDateFmt.timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
        sDateFmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    }
    sDateFmt.dateFormat = fmt;
    return [sDateFmt stringFromDate:self];
}

- (NSString *)timeString {
    return [self dateStringWithFormat:@"H:mm"];
}

- (NSString *)timeStringFromDate {
    return [self dateStringWithFormat:@"HH:mm"];
}

- (NSString *)dateTimeString {
    return [self dateStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
- (NSString *)dateTimeSecondString {
    return [self dateStringWithFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
}
- (NSString *)dateTimeSecondSSSString {
    return [self dateStringWithFormat:@"MMMM dd, yyyy HH:mm:ss:SSS"];
}
//字符串转date，字符串需要是yyyy-MM-dd格式
+ (NSDate *)dateFromString:(NSString *)string {
    return [self dateFromString:string format:@"yyyy-MM-dd"];
}

+ (NSDate *)datetimeFromString:(NSString *)string {
    return [self dateFromString:string format:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
}

+ (NSDate *)dateTimeFromDateTimeString:(NSString *)string {
    return [self dateFromString:string format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSDate *)timeFromString:(NSString *)string {
    return [self dateFromString:string format:@"HH:mm:ss"];
}

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)fmt {
    if (string == nil) {
        return nil;
    }
    static NSDateFormatter *sDateFmt = nil;
    if (sDateFmt == nil) {
        sDateFmt = [[NSDateFormatter alloc] init];
        sDateFmt.timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
        sDateFmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    }
    sDateFmt.dateFormat = fmt;
    return [sDateFmt dateFromString:string];
}

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;

    if ([date compare:endDate] == NSOrderedDescending)
        return NO;

    return YES;
}

@end
