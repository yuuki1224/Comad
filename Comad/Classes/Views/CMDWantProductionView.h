//
//  CMDWantProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDWantProductionViewDelegate <NSObject>

- (void)tappedWantProductionImageView;

@end

@interface CMDWantProductionView : UIView

@property (weak, nonatomic) id<CMDWantProductionViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIScrollView *wantProductionsScrollView;

+ (instancetype)wantProductionView;

@end
