//
//  CMDWantProductionView+RACSupport.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWantProductionView.h"
#import "RACSignal+Operations.h"

@class RACDelegateProxy;

@interface CMDWantProductionView (RACSupport)
@property (nonatomic, strong, readonly) RACDelegateProxy *rac_delegateProxy;

- (RACSignal *)rac_tappedWantProductionImageSignal;

@end
