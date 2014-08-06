//
//  CMDUserViewModel.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDUserViewModel.h"

@interface CMDUserViewModel ()
@end

@implementation CMDUserViewModel

#pragma mark - LifeCycle

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"浅野 友希";
        self.profileImageName = @"sampleProfileImage1";
    }
    
    return self;
}

@end
