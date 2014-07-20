//
//  CMDSideMenuView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMDSideMenuCell)
{
    CMDSideMenuCellHome = 0,
    CMDSideMenuCellSettings,
};

@protocol CMDSideMenuViewDelegate <NSObject>
@optional
- (void)sideMenuTapped:(CMDSideMenuCell)cellType;

@end

@interface CMDSideMenuView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITableView *sideMenuTabel;

@end
