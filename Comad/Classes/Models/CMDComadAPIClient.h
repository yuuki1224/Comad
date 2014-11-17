//
//  CMDComadAPIClient.h
//  Comad
//
//  Created by AsanoYuki on 2014/11/17.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

static NSString * const kCMDComadAPIGetTimeLineProductionsPath = @"productions/list";

@interface CMDComadAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getTimeLineProductionsWithUserId:(NSNumber *)userId completion:(void (^)(NSArray *results, NSError *error))block;

@end
