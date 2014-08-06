//
//  CMDLikeProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDLikeProductionView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *likeProductions;
@property (weak, nonatomic) IBOutlet UITableView *likeProductionTable;

+ (instancetype)likeProductionView;

@end
