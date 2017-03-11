//
//  ListPresenter.m
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import "ListPresenter.h"

#import "ListPresenterInterface.h"
#import "ListInteractorIO.h"
#import "ListWireframe.h"
#import "ListViewData.h"
#import "MovieWebService-Swift.h"
#import "Constants.h"
#import "NSString+Date.h"

@implementation ListPresenter

- (void)updateView
{
    [self.listInteractor findFilms];
}


#pragma mark - List Interactor Output

- (void)foundFilms:(NSArray *)films
{
    [self updateUserInterfaceWithFilms:films];
}


- (void)updateUserInterfaceWithFilms:(NSArray *)films
{
    [self.userInterface showList:[self filmDisplayDataWithItems:films]];
}


- (NSArray *)filmDisplayDataWithItems:(NSArray *)films
{
    NSMutableArray *filmsArray = [[NSMutableArray alloc] init];
    for /*(int i = 0; i < films.count; i++) //*/(id film in films)
    {
        //id film = [films objectAtIndex:i];
        NSString *name = (NSString *) [film valueForKey:kName];
        NSString *releaseDate = (NSString *) [self releaseDate:[film valueForKey:kReleaseDate]];
        
        NSArray *filmRatingEanum = kFilmRatingEnum;
        int filmRatingIndex = [[film valueForKey:kFilmRating] intValue];
        NSString *filmRating = filmRatingEanum[filmRatingIndex];
        
        NSString *rating = [NSString stringWithFormat:@"%@", [film valueForKey:kRating]];
        //@[kName, kFilmRating, kRating, kReleaseDate]
        NSArray *arrayOfObjects = kListValueArray;//@[name, filmRating, rating, releaseDate];
        NSArray *arrayOfKeys = kListKeysArray;
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:arrayOfObjects forKeys:arrayOfKeys];
        [filmsArray addObject:dictionary];
    }
    return filmsArray;
}

- (NSString *)releaseDate:(NSDate *)date
{
    return [NSString stringFromDate:date format:kReleaseDateFormat];
}

#pragma mark -- Talk to Details --
- (void)filmTapped:(id)film
{
    [self.listInteractor findDetailsForFilm:film];
}

@end
