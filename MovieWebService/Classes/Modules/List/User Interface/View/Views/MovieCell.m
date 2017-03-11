//
//  MovieCell.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "MovieCell.h"
#import "MovieWebService-Swift.h"
#import "Constants.h"

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCell:(NSDictionary *)film {
//    for (UIView *subview in self.subviews)
//    {
//        if ([subview isKindOfClass:[UILabel class]])
//        {
//            UILabel *label = (UILabel *)subview;
//            label.text =
//        }
//    }
    self.name.text       = (NSString *)[film valueForKey:kName];
    self.date.text       = (NSString *)[film valueForKey:kReleaseDate];
    self.filmRating.text = (NSString *)[film valueForKey:kFilmRating];
    self.rating.text     = (NSString *)[film valueForKey:kRating];

    //    self.name.text = film.name;
//
//    NSCalendar* cal = [NSCalendar new];
//    NSString* dateText;
//    NSDateFormatter *f = [[NSDateFormatter alloc] init];
//    [f setCalendar:cal];
//    dateText = [f stringFromDate:film.releaseDate];

//    self.date.text = dateText;
//    
//    NSString *filmRatingText;
//    switch (film.filmRating) {
//        case FilmRatingG:
//            filmRatingText = @"G";
//        case FilmRatingPG:
//            filmRatingText = @"PG";
//        case FilmRatingPG13:
//            filmRatingText = @"PG13";
//        case FilmRatingR:
//            filmRatingText = @"R";
//        case FilmRatingNC17:
//            filmRatingText = @"NC17";
//        default:
//            break;
//    }
//    self.filmRating.text =filmRatingText;
//    self.rating.text = [[NSNumber numberWithInteger:film.rating] stringValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSArray *) getListOfLabels
{
//    -(NSString *)propertyName:(id)property {
//        unsigned int numIvars = 0;
//        NSString *key=nil;
//        Ivar * ivars = class_copyIvarList([self class], &numIvars);
//        for(int i = 0; i < numIvars; i++) {
//            Ivar thisIvar = ivars[i];
//            if ((object_getIvar(self, thisIvar) == property)) {
//                key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
//                break;
//            }
//        }
//        free(ivars);
//        return key;
//    }
    return nil;
}
@end
