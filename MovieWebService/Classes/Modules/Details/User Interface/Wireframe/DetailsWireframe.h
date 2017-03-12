//
//  DetailsWireframe.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
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



