//
//  CMDLikeProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDLikeProductionViewDelegate <NSObject>
@optional
- (void)tappedLikeProductionCell:(UITableViewCell *)cell;
- (void)tappedOthersLikeProduction;

@end

@interface CMDLikeProductionView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *likeProductions;
@property (weak, nonatomic) IBOutlet UITableView *likeProductionTable;

@property (nonatomic, weak) id<CMDLikeProductionViewDelegate> delegate;

+ (instancetype)likeProductionView;

@end
