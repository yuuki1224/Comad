//
//  CMDUserHeaderView.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMDUserViewModel;

@interface CMDUserHeaderView : UIView

+ (instancetype)userHeaderView;

@property (nonatomic)CMDUserViewModel *userViewModel;

@end
