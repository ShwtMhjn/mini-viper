//
//  MovieWebServiceTests.m
//  MovieWebServiceTests
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "AppDependencies.h"

#import "BaseWireframe.h"
#import "ListWireframe.h"
#import "DetailsWireframe.h"

#import "ListPresenter.h"
#import "ListInteractor.h"
#import "ListInteractorIO.h"

#import "DetailsPresenter.h"
#import "DetailsInteractor.h"
#import "Constants.h"

@interface AppDependencies (Test)

@property (nonatomic, strong) ListWireframe *listWireframe;
@property (nonatomic, strong) DetailsInteractor *detailsInteractor;
//@property (nonatomic, strong) BaseWireframe *rootWireframe;
//@property (nonatomic, strong) ListPresenter *listPresenter;
//@property (nonatomic, strong) ListInteractor *listInteractor;
//@property (nonatomic, strong) DetailsWireframe *detailsWireFrame;
//@property (nonatomic, strong) DetailsPresenter *detailsPresenter;
- (BOOL)allInitialised;

@end

@implementation AppDependencies (Test)
//@dynamic listWireframe, listInteractor, listPresenter;
//@dynamic detailsInteractor, detailsPresenter, detailsWireFrame;
//@dynamic rootWireframe;

//- (void) setListPresenter:(ListPresenter *)listPresenter
//{
//    if (self.listPresenter == nil)
//    {
//        self.listPresenter = [[ListPresenter alloc] init];
//    }
//    self.listPresenter = listPresenter;
//}
//
//- (void) setListWireframe:(ListWireframe *)listWireframe
//{
//    if (self.listWireframe == nil)
//    {
//        self.listWireframe = [[ListWireframe alloc] init];
//    }
//    self.listWireframe = listWireframe;
//}
//
//- (void) setRootWireframe:(BaseWireframe *)rootWireframe
//{
//    if (self.rootWireframe == nil)
//    {
//        self.rootWireframe = [[BaseWireframe alloc] init];
//    }
//    self.rootWireframe = rootWireframe;
//}
- (BOOL)allInitialised {
    BOOL allInitialised = NO;
//    [self configureDependenciesTest];
    if ([self.listWireframe isKindOfClass:[ListWireframe class]] && [self.detailsInteractor isKindOfClass:[DetailsInteractor class]])
    {
        allInitialised = YES;
    }
    return allInitialised;
}

/*- (void)configureDependenciesTest {
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
    listInteractor.presenter = listPresenter;
    
    listPresenter.listInteractor = listInteractor;
    listPresenter.listWireframe = listWireframe;
    
    listWireframe.listPresenter = listPresenter;
    listWireframe.detailWireframe = detailsWireFrame;
    listWireframe.rootWireframe = rootWireframe;
    
    detailsInteractor.presenter = detailsPresenter;
    [detailsInteractor registerForNotificationsFromOtherInteractors:kReceiveObjectNotification selector:kPerformReceiveObjectSelector];
    
    detailsPresenter.detailsInteractor = detailsInteractor;
    detailsPresenter.detailsWireframe = detailsWireFrame;
    
    detailsWireFrame.detailPresenter = detailsPresenter;
    detailsWireFrame.listWireframe = listWireframe;
    detailsWireFrame.rootWireframe = rootWireframe;
    
    self.rootWireframe = rootWireframe;
    self.listWireframe = listWireframe;
    self.listPresenter = listPresenter;
    self.listInteractor = listInteractor;
    self.detailsInteractor = detailsInteractor;
    self.detailsPresenter = detailsPresenter;
    self.detailsWireFrame = detailsWireFrame;
}*/

@end

@interface MovieWebServiceTests : XCTestCase {
    AppDependencies *appDependency;
}
@end

@implementation MovieWebServiceTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    appDependency = [[AppDependencies alloc] init];
    [appDependency configureDependencies];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [appDependency removeObserver];
//    appDependency = nil;
    [super tearDown];
}

//- (void)testConfiguredDependenciesRootWireframe
//{
//    XCTAssertNotNil(appDependency.rootWireframe, "rootWireframe");
//}

- (void)testConfiguredDependenciesListWireframe
{
    XCTAssertNotNil(appDependency.listWireframe, "listWireframe");
}

- (void)testConfiguredDependenciesListWireframeDetailsWireframe
{
    XCTAssertTrue([appDependency.listWireframe.detailWireframe isKindOfClass:[DetailsWireframe class]], "listWireframe.detailWireframe is Not set");
}

- (void)testConfiguredDependenciesListWireframeListPresenter
{
    XCTAssertTrue([appDependency.listWireframe.listPresenter isKindOfClass:[ListPresenter class]], "listWireframe.listPresenter is Not set");
}

- (void)testConfiguredDependenciesListWireframeRootWireFrame
{
    XCTAssertTrue([appDependency.listWireframe.rootWireframe isKindOfClass:[BaseWireframe class]], "listWireframe.rootWireframe is Not set");
}

- (void)testConfiguredDependenciesDetailsInteractor
{
    XCTAssertNotNil(appDependency.detailsInteractor, "detailsInteractor");
}

- (void)testConfiguredDependenciesDetailsInteractorDisplaySource
{
    XCTAssertNil(appDependency.detailsInteractor.displaySource, "detailsInteractor displaySource has garbage value"); //Should be nil during the first configuration
}

- (void)testConfiguredDependenciesDetailsInteractorPresenter
{
    XCTAssertTrue([appDependency.detailsInteractor.presenter isKindOfClass:[DetailsPresenter class]], "detailsInteractor's presenter is Not set");
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
