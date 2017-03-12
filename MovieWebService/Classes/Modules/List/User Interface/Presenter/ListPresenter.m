//
//  ListPresenter.m
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
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
//Receives message from Interactor that the display items have been found
- (void)foundFilms:(NSArray *)films
{
    [self updateUserInterfaceWithFilms:films];
}


- (void)updateUserInterfaceWithFilms:(NSArray *)films
{
    [self.userInterface showList:[self filmDisplayDataWithItems:films]];
}

//Creates array of dictionaries. This could also be an array of ViewModels of the type ListViewData
- (NSArray *)filmDisplayDataWithItems:(NSArray *)films
{
    NSMutableArray *filmsArray = [[NSMutableArray alloc] init];
    for (id film in films)
    {
        NSString *name = (NSString *) [film valueForKey:kName];
        NSString *releaseDate = (NSString *) [self releaseDate:[film valueForKey:kReleaseDate]];
        
        NSArray *filmRatingEnum = kFilmRatingEnum;
        int filmRatingIndex = [[film valueForKey:kFilmRating] intValue];
        NSString *filmRating = filmRatingEnum[filmRatingIndex];
        
        NSString *rating = [NSString stringWithFormat:@"%@", [film valueForKey:kRating]];
        NSArray *arrayOfObjects = kListValueArray; //The order and content of these arraus can be modified in the Constants file
        NSArray *arrayOfKeys = kListKeysArray;
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:arrayOfObjects forKeys:arrayOfKeys];
        [filmsArray addObject:dictionary];
    }
    return filmsArray;
}

- (NSString *)releaseDate:(NSDate *)date
{
    return [NSString stringFromDate:date format:kReleaseDateFormat]; //The format can be changed in the constants
}

#pragma mark -- Talk to Details --
- (void)filmTapped:(id)film
{
    [self.listInteractor findDetailsForFilm:film]; //Asks the Interactor to find details for the tapped film
}

@end
