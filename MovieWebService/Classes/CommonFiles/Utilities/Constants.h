//
//  Constants.h
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

#ifndef Constants_h
#define Constants_h

#pragma mark -- Parsing Keys
#pragma mark -- Parsing Keys -- COMMON --
static NSString *const kNominated   = @"nominated";

#pragma mark -- Parsing Keys -- FILM --
static NSString *const kFilmRating  = @"filmRating";
static NSString *const kLanguages   = @"languages";
static NSString *const kReleaseDate = @"releaseDate";
static NSString *const kCast        = @"cast";
static NSString *const kRating      = @"rating";
static NSString *const kDirector    = @"director";

#pragma mark -- Parsing Keys -- GENERIC ROLE --
static NSString *const kDateOfBirth = @"dateOfBirth";
static NSString *const kName        = @"name";
static NSString *const kBiography   = @"biography";
static NSString *const kDirectorName = @"directorName";
static NSString *const kActorName    = @"actorName";

#pragma mark -- Parsing Keys -- ACTOR --
static NSString *const kScreenName  = @"screenName";

#pragma mark -- Formatters --
static NSString *const kReleaseDateFormat = @"MMM dd, yyyy";

#pragma mark -- Keys for List --
#define kListKeysArray              @[kName, kFilmRating, kRating, kReleaseDate]; //Because Array cannot                                                           be a static constant and we want it
#define kListValueArray              @[name, filmRating, rating, releaseDate]
#define kFilmRatingEnum             @[@"G", @"PG", @"PG13", @"R", @"NC17", @"UNDEFINED"]

#pragma mark -- Register for Notifications --
static NSString *const kReceiveObjectNotification  = @"receiveObjectNotification";
static NSString *const kPerformReceiveObjectSelector = @"performReceiveObjectSelector:";

#endif /* Constants_h */
