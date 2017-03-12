//
//  AppDependencies.m
//  MovieWebService
//
//  Created by Sasha on 09/03/17.
//

#import "AppDependencies.h"
#import "MovieWebService-Swift.h"
#import "Constants.h"

#import "BaseWireframe.h"

#import "ListInteractor.h"
#import "ListPresenter.h"
#import "ListWireframe.h"

#import "DetailsWireframe.h"
#import "DetailsInteractor.h"
#import "DetailsPresenter.h"

@interface AppDependencies ()

@property (nonatomic, strong) ListWireframe *listWireframe;
@property (nonatomic, strong) DetailsInteractor *detailsInteractor;

@end

@implementation AppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.listWireframe presentListInterfaceFromWindow:window];
}

- (void)configureDependencies {
    //Base Wireframe
    BaseWireframe *rootWireframe = [[BaseWireframe alloc] init];
    
    //List Module Classes
    ListWireframe *listWireframe = [[ListWireframe alloc] init];
    ListPresenter *listPresenter = [[ListPresenter alloc] init];
    ListInteractor *listInteractor = [[ListInteractor alloc] init];
    
    //Detail Module Classes
    DetailsWireframe *detailsWireFrame = [[DetailsWireframe alloc] init];
    DetailsInteractor *detailsInteractor = [[DetailsInteractor alloc] init];
    DetailsPresenter *detailsPresenter = [[DetailsPresenter alloc] init];

    //List Module properties
    [[FilmStore sharedInstance] findAndStoreFilms];
    listInteractor.displayListSource = [[FilmStore sharedInstance] films];
    listInteractor.presenter = listPresenter;
    
    listPresenter.listInteractor = listInteractor;
    listPresenter.listWireframe = listWireframe;
    
    listWireframe.listPresenter = listPresenter;
    listWireframe.detailWireframe = detailsWireFrame;
    listWireframe.rootWireframe = rootWireframe;
    self.listWireframe = listWireframe;


    detailsInteractor.presenter = detailsPresenter;
    [detailsInteractor registerForNotificationsFromOtherInteractors:kReceiveObjectNotification selector:kPerformReceiveObjectSelector];
    self.detailsInteractor = detailsInteractor;
    [self addObserver:self forKeyPath:@"self.detailsInteractor.displaySource" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    detailsPresenter.detailsInteractor = detailsInteractor;
    detailsPresenter.detailsWireframe = detailsWireFrame;
    
    detailsWireFrame.detailPresenter = detailsPresenter;
    detailsWireFrame.listWireframe = listWireframe;
    detailsWireFrame.rootWireframe = rootWireframe;
    
    //
    //    addPresenter.addModuleDelegate = listPresenter;
    //    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"From KVO");
    
    if([keyPath isEqualToString:@"self.detailsInteractor.displaySource"])
    {
        id oldC = [change objectForKey:NSKeyValueChangeOldKey];
        id newC = [change objectForKey:NSKeyValueChangeNewKey];
        
        NSLog(@"%@ %@", oldC, newC);
        [self.listWireframe presentDetailInterface];
    }
}

- (void) removeObserver{
    [self removeObserver:self forKeyPath:@"self.detailsInteractor.displaySource"];
}
@end
