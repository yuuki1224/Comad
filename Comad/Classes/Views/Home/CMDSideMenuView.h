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
    // Basic Section
    CMDSideMenuCellHome = 0,
    CMDSideMenuWatchedList,
    CMDSideMenuFavoriteList,
    CMDSideMenuWantList,
    CMDSideMenuFriendRelatedList,
    CMDSideMenuFollow,
    CMDSideMenuFollower,
    CMDSeachFriend,
    
    // Search Section
    CMDSideMenuAnimeList,
    CMDSideMenuNotPublicAnimeList,
    CMDSideMenuMovieList,
    CMDSideMenuFridayMovieList,
    CMDSideMenuNotPublicMovieList,
    CMDSideMenuDramaList,
    CMDSideMenuNotPublicDramaList,
    
    // Other Section
    CMDSideMenuSettings,
    CMDSideMenuLogout,
};

@protocol CMDSideMenuViewDelegate <NSObject>
@optional
- (void)sideMenuTapped:(CMDSideMenuCell)cellType;

@end

@interface CMDSideMenuView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) id<CMDSideMenuViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITableView *sideMenuTabel;

@end
