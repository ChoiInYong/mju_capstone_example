//
// Created by kyungtaek on 15. 4. 4..
// Copyright (c) 2015 BezierPaths. All rights reserved.
//

#import "NSDate+Support.h"


@implementation NSDate (Support)

+ (NSDate *)createSpecificDateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day {

    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];

    return [calendar dateFromComponents:comps];
}


-(NSDate *) toLocalTime
{
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate:self];
    return [NSDate dateWithTimeInterval:seconds sinceDate:self];
}

- (NSString *)shortString {

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy년 MM월 dd일"];
    NSString *dateString = [format stringFromDate:self];

    return dateString;

}


@end