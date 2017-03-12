//
//  DetailsInteractor.h
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

#import <Foundation/Foundation.h>
#import "DetailsInteractorIO.h"

@interface DetailsInteractor : NSObject <DetailsInteractorInput>

@property (nonatomic, weak) id<DetailsInteractorOutput> presenter;
@property (nonatomic, strong) id displaySource;

@end
