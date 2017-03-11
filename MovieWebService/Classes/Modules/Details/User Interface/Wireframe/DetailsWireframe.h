//
//  DetailsWireframe.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListWireframe;
@class DetailsPresenter;
@class DetailsViewController;
@class BaseWireframe;

@interface DetailsWireframe : NSObject

@property (nonatomic, strong) BaseWireframe     *rootWireframe;
@property (nonatomic, strong) ListWireframe     *listWireframe;
@property (nonatomic, strong) DetailsPresenter  *detailPresenter;

- (void)presentDetailInterfaceFromViewController:(UIViewController *)viewController;

@end



