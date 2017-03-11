//
//  ListInteractor.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListInteractorIO.h"
//@class ListDataManager;

@interface ListInteractor : NSObject <ListInteractorInput>

@property (nonatomic, weak) id<ListInteractorOutput> presenter;
@property (nonatomic, strong) NSArray *displayListSource;

@end
