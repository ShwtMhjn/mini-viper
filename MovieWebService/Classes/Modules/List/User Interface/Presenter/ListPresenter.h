//
//  ListPresenter.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPresenterInterface.h"
#import "ListInteractorIO.h"
#import "ListWireframe.h"
#import "ListViewInterface.h"

@interface ListPresenter : NSObject <ListPresenterInterface>

@property (nonatomic, strong) id<ListInteractorInput>       listInteractor;
@property (nonatomic, strong) ListWireframe*                listWireframe;

@property (nonatomic, strong) UIViewController<ListViewInterface> * userInterface;

@end
