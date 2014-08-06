//
//  CMDWatchedProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDWatchedProductionViewDelegate <NSObject>
@optional
- (void)tappedProductionCell:(UITableViewCell *)cell;
- (void)tappedOthersWatchedProduction;

@end

@interface CMDWatchedProductionView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *watchedProductions;
@property (weak, nonatomic) IBOutlet UITableView *commentTable;

@property (nonatomic, weak) id<CMDWatchedProductionViewDelegate> delegate;

+ (instancetype)watchedProductionView;

@end
