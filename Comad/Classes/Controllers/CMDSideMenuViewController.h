//
//  CMDSideMenuViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMDSideMenuCell)
{
    // User Image
    CMDSideMenuUserPage = 0,
    
    // Basic Section
    CMDSideMenuCellHome,
    CMDSideMenuWatchedList,
    CMDSideMenuFavoriteList,
    CMDSideMenuWantList,
    CMDSideMenuFriendRelatedList,
    CMDSideMenuFollow,
    CMDSideMenuFollower,
    CMDSideMenuSeachFriend,
    
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

@interface CMDSideMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITableView *sideMenuTabel;

+ (instancetype)sideMenuViewController;

- (IBAction)tappedUserImage:(id)sender;

@end
