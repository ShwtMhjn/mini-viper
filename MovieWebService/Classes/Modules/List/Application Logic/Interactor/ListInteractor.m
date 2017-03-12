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

//Presenter asks Interactor to find films that will be displayed. These items are picked from the displayListSource
- (void) findFilms
{
    [self showfilmDisplayObjects:self.displayListSource];
}

//Send display object to the presenter via the ListInteractorOutput Protocol
- (void) showfilmDisplayObjects:(NSArray *)filmDisplayArray
{
    [self.presenter foundFilms:filmDisplayArray];
}

//Presenter asks Interactor to find the details for film which was tapped in the tableView
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
    //Notification is fired for all listeners to tell them that the film is found. Whichever class needs this object can register to this notification
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kReceiveObjectNotification
     object:foundFilm];
}

@end
