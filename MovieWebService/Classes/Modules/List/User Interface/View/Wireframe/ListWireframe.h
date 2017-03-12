//
//  ListViewWireframe.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import <Foundation/Foundation.h>

@class DetailsWireframe;
@class ListPresenter;
@class ListViewController;
@class BaseWireframe;

@interface ListWireframe : NSObject

@property (nonatomic, strong) BaseWireframe     *rootWireframe;
@property (nonatomic, strong) DetailsWireframe  *detailWireframe;
@property (nonatomic, strong) ListPresenter     *listPresenter;

- (void)presentListInterfaceFromWindow:(UIWindow *)window;
- (void)presentDetailInterface;
- (void)showDetailViewController:(UIViewController *)detailViewController;

@end
