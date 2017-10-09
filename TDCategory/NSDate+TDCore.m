//
//  NSDate+Core.m
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright BunLV 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import "NSDate+TDCore.h"

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (TDCore)

#pragma mark Relative Dates

+ (NSDate *)td_dateWithDaysFromNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] td_dateByAddingDays:days];
}

+ (NSDate *)td_dateWithDaysBeforeNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] td_dateBySubtractingDays:days];
}

+ (NSDate *)td_dateTomorrow
{
    return [NSDate td_dateWithDaysFromNow:1];
}

+ (NSDate *)td_dateYesterday
{
    return [NSDate td_dateWithDaysBeforeNow:1];
}

+ (NSDate *)td_dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark Comparing Dates

- (BOOL)td_isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    return ((components1.year == components2.year)&&
            (components1.month == components2.month)&&
            (components1.day == components2.day));
}

- (BOOL)td_isToday
{
    return [self td_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)td_isTomorrow
{
    return [self td_isEqualToDateIgnoringTime:[NSDate td_dateTomorrow]];
}

- (BOOL)td_isYesterday
{
    return [self td_isEqualToDateIgnoringTime:[NSDate td_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)td_isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfMonth != components2.weekOfMonth)return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    int values = fabs([self timeIntervalSinceDate:aDate]);
    return (values < D_WEEK );
}

- (BOOL)td_isThisWeek
{
    return [self td_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)td_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self td_isSameWeekAsDate:newDate];
}

- (BOOL)td_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self td_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL)td_isSameMonthAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month)&&
            (components1.year == components2.year));
}

- (BOOL)td_isThisMonth
{
    return [self td_isSameMonthAsDate:[NSDate date]];
}

- (BOOL)td_isSameYearAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL)td_isThisYear
{
    // Thanks, baspellis
    return [self td_isSameYearAsDate:[NSDate date]];
}

- (BOOL)td_isNextYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL)td_isLastYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];

    return (components1.year == (components2.year - 1));
}

- (BOOL)td_isEarlierThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)td_isLaterThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL)td_isInFuture
{
    return ([self td_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL)td_isInPast
{
    return ([self td_isEarlierThanDate:[NSDate date]]);
}

#pragma mark Roles
- (BOOL)td_isTypicallyWeekend
{
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1)||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL)td_isTypicallyWorkday
{
    return ![self td_isTypicallyWeekend];
}

#pragma mark Adjusting Dates

- (NSDate *)td_dateByAddingDays:(NSInteger)dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingDays:(NSInteger)dDays
{
    return [self td_dateByAddingDays:(dDays * -1)];
}

- (NSDate *)td_dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingHours:(NSInteger)dHours
{
    return [self td_dateByAddingHours:(dHours * -1)];
}

- (NSDate *)td_dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingMinutes:(NSInteger)dMinutes
{
    return [self td_dateByAddingMinutes:(dMinutes * -1)];
}

- (NSDate *)td_dateAtStartOfDay
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [CURRENT_CALENDAR dateFromComponents:components];
}

- (NSDateComponents *)td_componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark Retrieving Intervals

- (NSTimeInterval)td_minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (ti / D_MINUTE);
}

- (NSTimeInterval)td_minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (ti / D_MINUTE);
}

- (NSTimeInterval)td_hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (ti / D_HOUR);
}

- (NSTimeInterval)td_hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (ti / D_HOUR);
}

- (NSTimeInterval)td_daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (ti / D_DAY);
}

- (NSTimeInterval)td_daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (ti / D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)td_distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark Decomposing Dates

- (NSInteger)td_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger)td_hour    { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].hour; }
- (NSInteger)td_minute  { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].minute; }
- (NSInteger)td_seconds { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].second; }
- (NSInteger)td_day     { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].day; }
- (NSInteger)td_month   { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].month; }
- (NSInteger)td_week    { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].weekOfMonth; }
- (NSInteger)td_weekday { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].weekday; }

// e.g. 2nd Tuesday of the month is 2
- (NSInteger)td_nthWeekday { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].weekdayOrdinal; }
- (NSInteger)td_year { return [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self].year; }

#pragma mark - Conversion
- (NSString *)td_stringFromFormat:(NSString *)format { return [self td_stringFromFormat:format timeZone:[NSTimeZone systemTimeZone]]; }

- (NSString *)td_utcStringFromFormat:(NSString *)format { return [self td_stringFromFormat:format timeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]]; }

- (NSString *)td_stringFromFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = format;
    dateFormat.timeZone = timeZone;
    return [dateFormat stringFromDate:self];
}

+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format
{
    return [self td_dateFromString:str format:format timeZone:[NSTimeZone systemTimeZone]];
}

+ (NSDate *)td_utcDateFromString:(NSString *)str format:(NSString *)format
{
    return [self td_dateFromString:str format:format timeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
}

+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format timeZone:(NSTimeZone *)timeZone
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = format;
    dateFormat.timeZone = timeZone;

    return [dateFormat dateFromString:str];
}

@end
