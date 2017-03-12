//
//  DetailsWireframe.m
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import "DetailsWireframe.h"
#import "DetailViewController.h"
#import "DetailsPresenter.h"
#import "ListWireframe.h"

static NSString *DetailsViewControllerIdentifier = @"DetailViewController";

@interface DetailsWireframe ()

@property (nonatomic, strong) DetailViewController *detailViewController;

@end

@implementation DetailsWireframe

-(void)presentDetailInterfaceFromViewController:(UIViewController *)viewController
{
    DetailViewController *detailViewController = [self detailsControllerFromStoryboard];
    detailViewController.eventHandler       = self.detailPresenter;
    self.detailPresenter.userInterface      = detailViewController;
    self.detailViewController               = detailViewController;
    
    [self.listWireframe showDetailViewController:detailViewController];
}

- (DetailViewController *) detailsControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    DetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:DetailsViewControllerIdentifier];
    
    return viewController;
}

#pragma mark -- Storyboard --
- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    return storyboard;
}

@end
