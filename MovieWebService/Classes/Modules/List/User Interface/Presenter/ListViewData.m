//
//  ListViewData.m
//  MovieWebService
//
//  Created by Sasha on 09/03/17.
//

#import "ListViewData.h"
#import "MovieWebService-Swift.h"

@implementation ListViewData

+ (instancetype)getFilmWithName:(NSString *)name filmRating:(FilmRating)filmRating rating:(NSInteger)rating releaseDate:(NSDate *)releaseDate {
    ListViewData *film = [[self alloc] init];
    film.filmName       = name;
//    film.filmRating     = [Constants.kFilmRatingEnum objectAtIndex:filmRating];
//    film.rating         = rating;
//    film.releaseDate    = rating;
    return film;
}

@end
