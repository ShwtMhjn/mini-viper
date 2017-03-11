//
//  NSString+Date.h
//  MovieWebService
//
//  Created by Sasha on 06/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end
