//
//  NSString+Date.h
//  MovieWebService
//
//  Created by Sasha on 09/03/17.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end
