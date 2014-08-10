//
//  CMDLikeListViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDLikeListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

+ (instancetype)likeListViewController;
@property (weak, nonatomic) IBOutlet UITableView *likeListTable;

@end
