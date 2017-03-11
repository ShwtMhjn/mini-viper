//
//  ListViewData.h
//  MovieWebService
//
//  Created by Sasha on 05/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListViewData : NSObject

@property (nonatomic, strong) NSString *filmName;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *filmRating;
@property (nonatomic, strong) NSString *rating;

+ (instancetype)getFilmWithName:(NSString *)name filmRating:(id)filmRating rating:(NSInteger)rating releaseDate:(NSDate *)releaseDate;

@end
