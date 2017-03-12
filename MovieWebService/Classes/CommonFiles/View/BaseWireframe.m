//
//  BaseWireframe.m
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import "BaseWireframe.h"

@implementation BaseWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
//    navigationController.viewControllers
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

@end
