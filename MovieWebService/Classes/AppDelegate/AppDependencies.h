//
//  AppDependencies.h
//  MovieWebService
//
//  Created by Sasha on 09/03/17.
//

#import <Foundation/Foundation.h>

@interface AppDependencies : NSObject

- (void)installRootViewControllerIntoWindow:(UIWindow *)window;
- (void)configureDependencies;
- (void) removeObserver;

@end
