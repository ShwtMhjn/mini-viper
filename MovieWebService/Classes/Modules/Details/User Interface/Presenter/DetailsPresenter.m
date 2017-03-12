//
//  DetailsPresenter.m
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

#import "DetailsPresenter.h"
#import "MovieWebService-Swift.h"
#import "Constants.h"
#import "DetailsWireframe.h"
#import "DetailsInteractorIO.h"
#import "DetailPresenterInterface.h"

@implementation DetailsPresenter

//- (void)updateView
//{
//    [self.detailsInteractor findDetails];
//}


#pragma mark - Details Interactor Output

- (void)foundDetails:(id)details //Film found by the ListInteractor and sent here from the Detail Interactor
{
    [self updateUserInterfaceWithDetails:details];
}


- (void)updateUserInterfaceWithDetails:(id)details
{
    [self.userInterface setDetails:[self filmDetailsDataWithItems:details]];
}

- (id)filmDetailsDataWithItems:(id)details
{
    NSMutableDictionary *detailDictionary = [NSMutableDictionary dictionary];
    [detailDictionary setObject:[[details valueForKey:kDirector] valueForKey:kName] forKey:kDirectorName]; //Director Name
    [detailDictionary setObject:[[[details valueForKey:@"actors"] firstObject] valueForKey:kName] forKey:kActorName]; //Actor Name
    [detailDictionary setObject:[[[details valueForKey:@"actors"] firstObject] valueForKey:kScreenName] forKey:kScreenName]; //Actor Screen Name
      return detailDictionary;
}


@end
