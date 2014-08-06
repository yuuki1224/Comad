//
//  CMDWatchedProductionView+RACSupport.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWatchedProductionView+RACSupport.h"
#import <RACDelegateProxy.h> 
#import <NSObject+RACDeallocating.h>
#import <NSObject+RACDescription.h>
#import <objc/runtime.h>

@implementation CMDWatchedProductionView (RACSupport)

static void RACUseDelegateProxy(CMDWatchedProductionView *self)
{
    if (self.delegate == self.rac_delegateProxy) return;
    self.rac_delegateProxy.rac_proxiedDelegate = self.delegate;
    self.delegate = (id)self.rac_delegateProxy;
}

- (RACDelegateProxy *)rac_delegateProxy
{
    RACDelegateProxy *proxy = objc_getAssociatedObject(self, _cmd);
    if (proxy == nil) {
        proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(CMDWatchedProductionViewDelegate)];
        objc_setAssociatedObject(self, _cmd, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}

- (RACSignal *)rac_tappedWatchedProductionCellSignal
{
    // Signal作ってる まあdelegateが起動したらsignal発生するように設定してwる
	RACSignal *signal = [[[[self.rac_delegateProxy signalForSelector:@selector(tappedProductionCell:)]
                           reduceEach:^(UITableViewCell *cell) {
                               return cell;
                           }]
                          takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_updateTappedSignal", [self rac_description]];
    
    // これでdelegateに入れ合ってるの?
	RACUseDelegateProxy(self);
    
	return signal;
}

- (RACSignal *)rac_tappedOthersCommentSignal
{
    // Signal作ってる
    RACSignal *signal = [[[self.rac_delegateProxy signalForSelector:@selector(tappedOthersWatchedProduction)]
                          takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_tappedOthersCommentSignal", [self rac_description]];
    
    RACUseDelegateProxy(self);
    
    return signal;
}

@end
