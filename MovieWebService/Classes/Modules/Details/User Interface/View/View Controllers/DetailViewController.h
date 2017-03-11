//
//  DetailViewController.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TappableLabel.h"
#import "DetailPresenterInterface.h"
#import "DetailsViewInterface.h"

//@class Film;

@interface DetailViewController : UIViewController <TappableLabelDelegate, DetailsViewInterface>

@property (nonatomic, strong) id<DetailsPresenterInterface> eventHandler;

@property (strong, nonatomic) IBOutlet UILabel *directorName;
@property (strong, nonatomic) IBOutlet UILabel *actorName;
@property (strong, nonatomic) IBOutlet UILabel *actorScreenName;
@property (strong, nonatomic) IBOutlet UILabel *actorNameTitle;
@property (strong, nonatomic) IBOutlet UILabel *actorScreenNameTitle;

@property (strong, nonatomic) TappableLabel *tapToShowMore;

@end
