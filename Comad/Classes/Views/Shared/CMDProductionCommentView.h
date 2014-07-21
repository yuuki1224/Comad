//
//  CMDProductionCommentView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDProductionCommentDelegate <NSObject>
@optional
- (void)tappedCommentCell:(UITableViewCell *)cell;
- (void)tappedOthersComment;

@end

@interface CMDProductionCommentView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) id<CMDProductionCommentDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableView *commentTable;

@end