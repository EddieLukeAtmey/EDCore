//
//  NSDate+Core.h
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright BunLV 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import <Foundation/Foundation.h>

@interface NSDate (TDCore)

// Relative dates from the current date
+ (NSDate *)td_dateTomorrow;
+ (NSDate *)td_dateYesterday;
+ (NSDate *)td_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)td_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)td_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)td_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)td_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)td_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

// Comparing dates
- (BOOL)td_isEqualToDateIgnoringTime:(NSDate *)aDate;
- (BOOL)td_isToday;
- (BOOL)td_isTomorrow;
- (BOOL)td_isYesterday;
- (BOOL)td_isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)td_isThisWeek;
- (BOOL)td_isNextWeek;
- (BOOL)td_isLastWeek;
- (BOOL)td_isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)td_isThisMonth;
- (BOOL)td_isSameYearAsDate:(NSDate *)aDate;
- (BOOL)td_isThisYear;
- (BOOL)td_isNextYear;
- (BOOL)td_isLastYear;
- (BOOL)td_isEarlierThanDate:(NSDate *)aDate;
- (BOOL)td_isLaterThanDate:(NSDate *)aDate;
- (BOOL)td_isInFuture;
- (BOOL)td_isInPast;

// Date roles
- (BOOL)td_isTypicallyWorkday;
- (BOOL)td_isTypicallyWeekend;

// Adjusting dates
- (NSDate *)td_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)td_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)td_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)td_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)td_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)td_dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate *)td_dateAtStartOfDay;

// Retrieving intervals
- (NSTimeInterval)td_minutesAfterDate:(NSDate *)aDate;
- (NSTimeInterval)td_minutesBeforeDate:(NSDate *)aDate;
- (NSTimeInterval)td_hoursAfterDate:(NSDate *)aDate;
- (NSTimeInterval)td_hoursBeforeDate:(NSDate *)aDate;
- (NSTimeInterval)td_daysAfterDate:(NSDate *)aDate;
- (NSTimeInterval)td_daysBeforeDate:(NSDate *)aDate;
- (NSInteger)td_distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark - Converter
/** Convert date to string with format, time zone = system timezone. */
- (NSString *)td_stringFromFormat:(NSString *)format;

/** Convert date to string with format, time zone = GMT+0 */
- (NSString *)td_utcStringFromFormat:(NSString *)format;

/** Convert date to string with format, custom time zone */
- (NSString *)td_stringFromFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;

/** Convert string to date with format, system time zone */
+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format;

/** Convert string to date with format, time zone = GMT+0 */
+ (NSDate *)td_utcDateFromString:(NSString *)str format:(NSString *)format;

/** Convert string to date with format, custom time zone */
+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format timeZone:(NSTimeZone *)timeZone;

// Decomposing dates
@property (readonly) NSInteger td_nearestHour;
@property (readonly) NSInteger td_hour;
@property (readonly) NSInteger td_minute;
@property (readonly) NSInteger td_seconds;
@property (readonly) NSInteger td_day;
@property (readonly) NSInteger td_month;
@property (readonly) NSInteger td_week;
@property (readonly) NSInteger td_weekday;
@property (readonly) NSInteger td_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger td_year;

@end
