//
//  CMDUserPageViewModel.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDUserPageViewModel.h"

@interface CMDUserPageViewModel ()

@property (nonatomic, readwrite) NSArray *likeProductions;
@property (nonatomic, readwrite) NSArray *watchedProductions;
@property (nonatomic, readwrite) NSArray *wantProductions;

@end

@implementation CMDUserPageViewModel

#pragma mark - LifeCycle

- (id)init
{
    self = [super init];
    
    if (self) {
        self.likeProductions = @[
                                 @"sampleAnime1",
                                 @"sampleAnime2",
                                 @"sampleAnime3",
                                 @"sampleMovie1",
                                 @"sampleMovie2",
                                 @"sampleMovie3",
                                 ];
        self.watchedProductions = @[
                                    @"sampleAnime1",
                                    @"sampleAnime2",
                                    @"sampleAnime3",
                                    @"sampleMovie1",
                                    @"sampleMovie2",
                                    @"sampleMovie3",
                                    ];
        self.wantProductions = @[
                                 @"sampleAnime1",
                                 @"sampleAnime2",
                                 @"sampleAnime3",
                                 @"sampleMovie1",
                                 @"sampleMovie2",
                                 @"sampleMovie3",
                                 ];
    }
    
    return self;
}

@end
