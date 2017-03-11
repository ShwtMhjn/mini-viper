//
//  BaseWireframe.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPresenterInterface.h"

@class ListViewController;

@interface BaseWireframe : NSObject

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window;

@end
