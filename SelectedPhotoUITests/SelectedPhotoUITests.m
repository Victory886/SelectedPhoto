//
//  SelectedPhotoUITests.m
//  SelectedPhotoUITests
//
//  Created by 收付宝－胜利 on 16/5/19.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SelectedPhotoUITests : XCTestCase

@end

@implementation SelectedPhotoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testExample {
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"touchesBegan"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element tap];
    
    XCUIElement *button = app.sheets.collectionViews.buttons[@"从相册中选择"];
    [button tap];
    [app.tables.buttons[@"Camera Roll"] tap];
    [app.navigationBars[@"Camera Roll"].buttons[@"Cancel"] tap];
    
    
    
    
    
}

@end
