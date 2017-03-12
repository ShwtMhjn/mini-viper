//
//  BaseWireframe.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import <Foundation/Foundation.h>
#import "ListPresenterInterface.h"

@class ListViewController;

@interface BaseWireframe : NSObject

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window;

@end
