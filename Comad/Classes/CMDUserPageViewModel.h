//
//  CMDUserPageViewModel.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDUserPageViewModel : NSObject

@property (nonatomic, readonly) NSArray *likeProductions;
@property (nonatomic, readonly) NSArray *watchedProductions;
@property (nonatomic, readonly) NSArray *wantProductions;

@end
