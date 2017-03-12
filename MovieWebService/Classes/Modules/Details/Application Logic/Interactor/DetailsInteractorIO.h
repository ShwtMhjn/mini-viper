//
//  DetailsInteractorIO.h
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

#ifndef DetailsInteractorIO_h
#define DetailsInteractorIO_h

@protocol DetailsInteractorInput <NSObject>

//- (void)findDetails;
- (void)registerForNotificationsFromOtherInteractors:(NSString *)notificationName selector:(NSString *)selector;

@end


@protocol DetailsInteractorOutput <NSObject>

- (void)foundDetails:(id)details;

@end

#endif /* DetailsInteractorIO_h */
