//
//  DetailsPresenter.h
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

#import <Foundation/Foundation.h>
#import "DetailPresenterInterface.h"
#import "DetailsInteractorIO.h"
#import "DetailViewController.h"
#import "DetailsViewInterface.h"
#import "DetailsWireframe.h"

@interface DetailsPresenter : NSObject <DetailsPresenterInterface>

@property (nonatomic, strong) id<DetailsInteractorInput>    detailsInteractor;
@property (nonatomic, strong) DetailsWireframe *            detailsWireframe;

@property (nonatomic, strong) UIViewController<DetailsViewInterface> * userInterface;

@end
