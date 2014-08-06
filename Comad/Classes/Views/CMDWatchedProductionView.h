//
//  CMDWatchedProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDWatchedProductionView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *watchedProductions;
@property (weak, nonatomic) IBOutlet UITableView *commentTable;

+ (instancetype)watchedProductionView;

@end
