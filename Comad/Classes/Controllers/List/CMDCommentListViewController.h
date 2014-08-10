//
//  CMDCommentListViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDCommentListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

+ (instancetype)commentListViewController;
@property (weak, nonatomic) IBOutlet UITableView *commentListTable;

@end
