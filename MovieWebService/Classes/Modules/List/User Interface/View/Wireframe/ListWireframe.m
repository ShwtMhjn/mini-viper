//
//  ListViewWireframe.m
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import "ListWireframe.h"
#import "DetailsWireframe.h"
#import "ListPresenter.h"
#import "ListViewController.h"
#import "BaseWireframe.h"

//#import "UpcomingDisplayData.h"
//#import "UpcomingDisplaySection.h"
//#import "UpcomingDisplayItem.h"

static NSString *ListViewControllerIdentifier = @"ListViewController";

@interface ListWireframe ()

@property (nonatomic, strong) ListViewController *listViewController;

@end

@implementation ListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    ListViewController *listViewController = [self listViewControllerFromStoryboard];
    listViewController.eventHandler     = self.listPresenter;
    self.listPresenter.userInterface    = listViewController;
    self.listViewController = listViewController;
    
    [self.rootWireframe showRootViewController:listViewController
                                      inWindow:window];
    
//    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:optionalFirstViewController];
//    [optionalFirstViewController release];
//    self.window.rootViewController = homeNavigationController;
//    [homeNavigationController release];
//    [self.window makeKeyAndVisible];

}


- (void)presentDetailInterface
{
    [self.detailWireframe presentDetailInterfaceFromViewController:self.listViewController];
}

- (void)showDetailViewController:(UIViewController *)detailViewController
{

//    [self.listViewController performSegueWithIdentifier:@"DetailForSelection" sender:self.listViewController];
    UINavigationController *navigationController = [self navigationControllerFromWindow:[[[UIApplication sharedApplication] delegate] window]];
    [navigationController pushViewController:detailViewController animated:YES];
//    [navigationController.viewControllers arrayByAddingObject:detailViewController];// = @[viewController];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}



- (ListViewController *)listViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    ListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ListViewControllerIdentifier];
    
    return viewController;
}



- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
