//
//  CMDProductionPageViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

// for Delegate
#import "CMDProductionCommentView.h"
#import "CMDWantProductionPeopleView.h"
#import "CMDRelatedProductionView.h"

@interface CMDProductionPageViewController : UIViewController <CMDProductionCommentViewDelegate, CMDRelatedProductionViewDelegate, CMDWantProductionPeopleViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

+ (instancetype)productionPageViewController;

@end
