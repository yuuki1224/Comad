//
//  CMDWatchedListViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDWatchedListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

+ (instancetype)watchedListViewController;

@property (weak, nonatomic) IBOutlet UITableView *watchedListTable;

@end
