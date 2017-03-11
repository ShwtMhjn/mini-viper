//
//  NSString+Date.m
//  MovieWebService
//
//  Created by Sasha on 06/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *string = [dateFormatter stringFromDate:date];
    return string;
}

@end
