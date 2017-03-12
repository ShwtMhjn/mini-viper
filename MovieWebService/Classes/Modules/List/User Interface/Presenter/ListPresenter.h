//
//  ListPresenter.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
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
