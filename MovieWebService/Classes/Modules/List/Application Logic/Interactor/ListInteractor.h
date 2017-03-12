//
//  ListInteractor.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import <Foundation/Foundation.h>
#import "ListInteractorIO.h"
//@class ListDataManager;

@interface ListInteractor : NSObject <ListInteractorInput>

@property (nonatomic, weak) id<ListInteractorOutput> presenter;
@property (nonatomic, strong) NSArray *displayListSource;

@end
