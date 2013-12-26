//
//  TATestTAViewController.m
//  TravisTestApp
//
//  Created by Larissa Kalbhenn on 26.12.13.
//  Copyright (c) 2013 com.tailored-apps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TAViewController.h"

@interface TATestTAViewController : XCTestCase

@end

@implementation TATestTAViewController

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}


@end
