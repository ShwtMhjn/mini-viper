//
//  DetailsInteractor.m
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import "DetailsInteractor.h"

@implementation DetailsInteractor

- (void)registerForNotificationsFromOtherInteractors:(NSString *)notificationName selector:(NSString *)selector
{
//    NSString *string = @"receiveTestNotification";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:(NSSelectorFromString(selector))
                                             name:notificationName
                                           object:nil];
}

- (void)performReceiveObjectSelector:(NSNotification *) notification
{
    //Received object from the Notification which may have originated in any of the Modules
    self.displaySource = notification.object;
    [self showfilmDisplayObjects:notification.object];
}

- (void) showfilmDisplayObjects:(id)details
{
    [self.presenter foundDetails:details];
}

@end
