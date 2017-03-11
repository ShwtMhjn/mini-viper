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
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    appDependency = nil;
    [super tearDown];
}

- (void)testConfiguredDependencies
{
    [appDependency configureDependencies];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
