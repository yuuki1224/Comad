//
//  CMDHomeController.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDHomeController.h"

@implementation CMDHomeController {
    CMDSideMenuView *_sideMenu;
    UIView *_backView;
    UITapGestureRecognizer *_tapGestureRecognizer;
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *sideMenuVC = [customViewStoryboard instantiateViewControllerWithIdentifier:@"CMDSideMenuView"];
    
    _sideMenu = (CMDSideMenuView *)sideMenuVC.view;
    _sideMenu.frame = CGRectMake(-280, 0, 280, 568);
    _sideMenu.delegate = self;
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.5;
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackView:)];
    [_backView addGestureRecognizer:_tapGestureRecognizer];
}

#pragma mark - Private

- (void)p_hideSideBarAndBackView
{
    [_backView removeFromSuperview];
    [UIView animateWithDuration:0.1 animations:^{
        _sideMenu.frame = CGRectMake(-280, 0, 280, 568);
    }];
}

#pragma mark - UITapGestureRecognizer Action

- (void)tapBackView:(UITapGestureRecognizer *)sender
{
    [self p_hideSideBarAndBackView];
}

#pragma mark - IBAction

- (void)tappedMenu:(id)sender
{
    [self.viewController.navigationController.view addSubview:_backView];
    [self.viewController.navigationController.view addSubview:_sideMenu];
    
    [UIView animateWithDuration:0.2 animations:^{
        _sideMenu.frame = CGRectMake(0, 0, 280, 568);
    }];
}

#pragma mark - CMDSideMenuDelegate

- (void)sideMenuTapped:(CMDSideMenuCell)cellType
{
    if (cellType == CMDSideMenuLogout) {
        UIActionSheet *logoutActionSheet = [[UIActionSheet alloc] init];
        [logoutActionSheet addButtonWithTitle:@"ログアウト"];
        [logoutActionSheet addButtonWithTitle:@"キャンセル"];
        [logoutActionSheet setCancelButtonIndex:1];
        
        [logoutActionSheet showInView:self.viewController.navigationController.view];
        return;
    }
    
    [self p_hideSideBarAndBackView];
    
    // Segue呼び出し
    switch (cellType) {
        case CMDSideMenuCellHome:
            break;
        case CMDSideMenuWatchedList:
            [self.viewController performSegueWithIdentifier:@"CMDWatchedListSegue" sender:self];
            break;
        case CMDSideMenuFavoriteList:
            [self.viewController performSegueWithIdentifier:@"CMDFavoriteListSegue" sender:self];
            break;
        case CMDSideMenuWantList:
            [self.viewController performSegueWithIdentifier:@"CMDWantListSegue" sender:self];
            break;
        case CMDSideMenuFriendRelatedList:
            [self.viewController performSegueWithIdentifier:@"CMDFriendRelatedListSegue" sender:self];
            break;
        case CMDSideMenuFollow:
            [self.viewController performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
            break;
        case CMDSideMenuFollower:
            [self.viewController performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
            break;
        case CMDSideMenuSeachFriend:
            break;
        case CMDSideMenuAnimeList:
            [self.viewController performSegueWithIdentifier:@"CMDAnimeListSegue" sender:self];
            break;
        case CMDSideMenuNotPublicAnimeList:
            [self.viewController performSegueWithIdentifier:@"CMDAnimeListSegue" sender:self];
            break;
        case CMDSideMenuMovieList:
            [self.viewController performSegueWithIdentifier:@"CMDMovieListSegue" sender:self];
            break;
        case CMDSideMenuFridayMovieList:
            [self.viewController performSegueWithIdentifier:@"CMDMovieListSegue" sender:self];
            break;
        case CMDSideMenuNotPublicMovieList:
            [self.viewController performSegueWithIdentifier:@"CMDMovieListSegue" sender:self];
            break;
        case CMDSideMenuDramaList:
            [self.viewController performSegueWithIdentifier:@"CMDDramaListSegue" sender:self];
            break;
        case CMDSideMenuNotPublicDramaList:
            [self.viewController performSegueWithIdentifier:@"CMDDramaListSegue" sender:self];
            break;
        case CMDSideMenuSettings:
            [self.viewController performSegueWithIdentifier:@"CMDSettingsSegue" sender:self];
            break;
        default:
            break;
    }
}

@end
