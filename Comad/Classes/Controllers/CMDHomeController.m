//
//  CMDHomeController.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDHomeController.h"

@implementation CMDHomeController {
    // Storyboard
    UIStoryboard *_mainStoryboard;
    UIStoryboard *_productionListStoryboard;
    UIStoryboard *_customViewStoryboard;
    UIStoryboard *_settingsStoryboard;
    
    // CustomView
    CMDSideMenuView *_sideMenu;
    
    UIView *_backView;
    UITapGestureRecognizer *_tapGestureRecognizer;
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    _mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    _productionListStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardProductionListIdentifier bundle:nil];
    _customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    _settingsStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardSettingsIdentifier bundle:nil];
    
    UIViewController *sideMenuVC = [_customViewStoryboard instantiateViewControllerWithIdentifier:@"CMDSideMenuView"];
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
        logoutActionSheet.delegate = self;
        [logoutActionSheet addButtonWithTitle:@"ログアウト"];
        [logoutActionSheet addButtonWithTitle:@"キャンセル"];
        [logoutActionSheet setCancelButtonIndex:1];
        
        [logoutActionSheet showInView:self.viewController.navigationController.view];
        return;
    }
    
    [self p_hideSideBarAndBackView];
    
    // Segue呼び出し
    switch (cellType) {
        case CMDSideMenuUserPage:
        {
            [self.viewController performSegueWithIdentifier:kCMDStoryBoardSegueUserIdentifier sender:self];
            break;
        }
        case CMDSideMenuCellHome:
            break;
        case CMDSideMenuWatchedList:
        {
            UIViewController *watchedListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDWatchedListViewController"];
            [self.viewController.navigationController pushViewController:watchedListViewController animated:YES];
            break;
        }
        case CMDSideMenuFavoriteList:
        {
            UIViewController *favoriteListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDFavoriteListViewController"];
            [self.viewController.navigationController pushViewController:favoriteListViewController animated:YES];
            break;
        }
        case CMDSideMenuWantList:
        {
            UIViewController *wantListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDWantListViewController"];
            [self.viewController.navigationController pushViewController:wantListViewController animated:YES];
            break;
        }
        case CMDSideMenuFriendRelatedList:
        {
            UIViewController *friendRelatedListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDFriendRelatedListViewController"];
            [self.viewController.navigationController pushViewController:friendRelatedListViewController animated:YES];
            break;
        }
        case CMDSideMenuFollow:
            [self.viewController performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
            break;
        case CMDSideMenuFollower:
            [self.viewController performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
            break;
        case CMDSideMenuSeachFriend:
            break;
        case CMDSideMenuAnimeList:
        {
            UIViewController *animeListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDAnimeListViewController"];
            [self.viewController.navigationController pushViewController:animeListViewController animated:YES];
            break;
        }
        case CMDSideMenuNotPublicAnimeList:
        {
            UIViewController *animeListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDAnimeListViewController"];
            [self.viewController.navigationController pushViewController:animeListViewController animated:YES];
            break;
        }
        case CMDSideMenuMovieList:
        {
            UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
            [self.viewController.navigationController pushViewController:movieListViewController animated:YES];
            break;
        }
        case CMDSideMenuFridayMovieList:
        {
            UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
            [self.viewController.navigationController pushViewController:movieListViewController animated:YES];
            break;
        }
        case CMDSideMenuNotPublicMovieList:
        {
            UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
            [self.viewController.navigationController pushViewController:movieListViewController animated:YES];
            break;
        }
        case CMDSideMenuDramaList:
        {
            UIViewController *dramaListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDDramaListViewController"];
            [self.viewController.navigationController pushViewController:dramaListViewController animated:YES];
            break;
        }
        case CMDSideMenuNotPublicDramaList:
        {
            UIViewController *dramaListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDDramaListViewController"];
            [self.viewController.navigationController pushViewController:dramaListViewController animated:YES];
            break;
        }
        case CMDSideMenuSettings:
        {
            UIViewController *settingsViewController = [_settingsStoryboard instantiateViewControllerWithIdentifier:@"CMDSettingsViewController"];
            [self.viewController.navigationController pushViewController:settingsViewController animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // ログアウト処理
        [self p_hideSideBarAndBackView];
        
        // rootViewControllerをCMDInitialViewControllerをイニシャライズしてセット
        UIViewController *initialViewController = [_mainStoryboard instantiateViewControllerWithIdentifier:@"CMDInitialViewController"];
        UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        window.rootViewController = initialViewController;
    }
}

@end
