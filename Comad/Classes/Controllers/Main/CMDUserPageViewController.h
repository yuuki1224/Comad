//
//  CMDUserPageViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMDUserPageViewModel;

@interface CMDUserPageViewController : UIViewController

@property (nonatomic)CMDUserPageViewModel *userPageViewModel;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

+ (instancetype)userPageViewController;

@end
