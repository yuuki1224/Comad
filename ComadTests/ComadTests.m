//
//  ComadTests.m
//  ComadTests
//
//  Created by AsanoYuki on 2014/07/19.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CMDComadAPIClient.h"

@interface ComadTests : XCTestCase

@end

@implementation ComadTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    __block BOOL isFinished = NO;
    CMDComadAPIClient *sharedClient = [CMDComadAPIClient sharedClient];
    [sharedClient getTimeLineProductionsWithUserId:@1 completion:^(NSArray *results, NSError *error) {
        isFinished = YES;
    }];
    
    // Blocksの中が実行されるまで待つ
    while (!isFinished) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
}

@end
