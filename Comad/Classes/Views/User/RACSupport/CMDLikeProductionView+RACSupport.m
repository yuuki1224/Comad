//
//  CMDLikeProductionView+RACSupport.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDLikeProductionView+RACSupport.h"
#import <RACDelegateProxy.h>
#import <NSObject+RACDeallocating.h>
#import <NSObject+RACDescription.h>
#import <objc/runtime.h>

@implementation CMDLikeProductionView (RACSupport)

static void RACUseDelegateProxy(CMDLikeProductionView *self)
{
    if (self.delegate == self.rac_delegateProxy) return;
    self.rac_delegateProxy.rac_proxiedDelegate = self.delegate;
    self.delegate = (id)self.rac_delegateProxy;
}

- (RACDelegateProxy *)rac_delegateProxy
{
    RACDelegateProxy *proxy = objc_getAssociatedObject(self, _cmd);
    if (proxy == nil) {
        proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(CMDLikeProductionViewDelegate)];
        objc_setAssociatedObject(self, _cmd, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}

// tappedLikeProductionCell:のSignal
- (RACSignal *)rac_tappedLikeProductionCellSignal
{
    RACSignal *signal = [[[[self.rac_delegateProxy signalForSelector:@selector(tappedLikeProductionCell:)]
                          reduceEach:^(UITableViewCell *cell){
                              return cell;
                          }]
                         takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_tappedLikeProductionCellSignal", [self rac_description]];
    
    RACUseDelegateProxy(self);
    
    return signal;
}

// tappedOthersLikeProductionのSignal
- (RACSignal *)rac_tappedOthersLikeProductionSignal
{
    RACSignal *signal = [[[self.rac_delegateProxy signalForSelector:@selector(tappedOthersLikeProduction)]
                          takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_tappedOthersLikeProductionSignal", [self rac_description]];
    
    RACUseDelegateProxy(self);
    
    return signal;
}

@end
