//
//  ListInteractor.m
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import "ListInteractor.h"
#import "ListViewData.h"
#import "Constants.h"

@interface ListInteractor () {
    NSMutableArray *filmDisplayObjects;
}

@end

@implementation ListInteractor

- (void) findFilms
{
    [self showfilmDisplayObjects:self.displayListSource];
}

- (void) showfilmDisplayObjects:(NSArray *)filmDisplayArray
{
    [self.presenter foundFilms:filmDisplayArray];
}

- (void) findDetailsForFilm:(id)film
{
    id foundFilm;
    for (NSDictionary *obj in self.displayListSource) {
        if ([[obj valueForKey:@"name"] isEqualToString:[film valueForKey:@"name"]])
        {
            foundFilm = obj;
            break;
        }
    }
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kReceiveObjectNotification
     object:foundFilm];
}

@end
