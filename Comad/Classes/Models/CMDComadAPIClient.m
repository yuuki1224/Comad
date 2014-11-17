//
//  CMDComadAPIClient.m
//  Comad
//
//  Created by AsanoYuki on 2014/11/17.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDComadAPIClient.h"

@implementation CMDComadAPIClient

#pragma mark - Class Methods

+ (instancetype)sharedClient
{
    static CMDComadAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CMDComadAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kCMDComadAPIHostURL]];
    });
    
    return _sharedClient;
}

#pragma mark - Instance Methods

- (void)getTimeLineProductionsWithUserId:(NSNumber *)userId completion:(void (^)(NSArray *, NSError *))block
{
    [self GET:kCMDComadAPIGetTimeLineProductionsPath
    parameters:nil
    success:^(NSURLSessionDataTask *task, id responseObject) {
          block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
          block(nil, error);
    }];
}

@end
