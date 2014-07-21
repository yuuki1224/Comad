//
//  CMDProductionPageViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMDProductionCommentView.h"

@interface CMDProductionPageViewController : UIViewController <CMDProductionCommentDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end
