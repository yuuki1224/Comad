//
//  CMDWantProductionView+RACSupport.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWantProductionView+RACSupport.h"
#import <RACDelegateProxy.h>
#import <NSObject+RACDeallocating.h>
#import <NSObject+RACDescription.h>
#import <objc/runtime.h>

@implementation CMDWantProductionView (RACSupport)

static void RACUseDelegateProxy(CMDWantProductionView *self)
{
    if (self.delegate == self.rac_delegateProxy) return;
    self.rac_delegateProxy.rac_proxiedDelegate = self.delegate;
    self.delegate = (id)self.rac_delegateProxy;
}

- (RACDelegateProxy *)rac_delegateProxy
{
    RACDelegateProxy *proxy = objc_getAssociatedObject(self, _cmd);
    if (proxy == nil) {
        proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(CMDWantProductionViewDelegate)];
        objc_setAssociatedObject(self, _cmd, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}

- (RACSignal *)rac_tappedWantProductionImageSignal
{
    RACSignal *signal = [[[self.rac_delegateProxy signalForSelector:@selector(tappedWantProductionImageView)]
                          takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_tappedWantProductionImageSignal", [self rac_description]];
    
    RACUseDelegateProxy(self);
    
    return signal;
}

@end
