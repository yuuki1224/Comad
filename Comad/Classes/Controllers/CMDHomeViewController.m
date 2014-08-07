//
//  CMDHomeViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDHomeViewController.h"

#import "CMDAppDelegate.h"

#import "CMDSideMenuViewController.h"

@interface CMDHomeViewController ()
{
    // Storyboard
    UIStoryboard *_mainStoryboard;
    UIStoryboard *_productionListStoryboard;
    UIStoryboard *_customViewStoryboard;
    UIStoryboard *_settingsStoryboard;
    
    UITapGestureRecognizer *_tapGestureRecognizer;
}

@end

@implementation CMDHomeViewController

#pragma mark - Class method

+ (id)navigationController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:@"CMDNavigationController"];
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    // storyboardインスタンス化
    _mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    _productionListStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardProductionListIdentifier bundle:nil];
    _customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    _settingsStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardSettingsIdentifier bundle:nil];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(receivedSideBarNotification:) name:kCMDNotificationSideMenu object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

#pragma mark - Notification

- (void)receivedSideBarNotification:(NSNotification *)notification
{
    CMDAppDelegate *appDelegate = (CMDAppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.viewController showCenterPanelAnimated:NO];
    
    NSDictionary *userInfo = notification.userInfo;
    NSNumber *cellTypeNumber = (NSNumber *)userInfo[@"tappedCell"];
    CMDSideMenuCell cellType = [cellTypeNumber intValue];
    
    if (cellType == CMDSideMenuLogout) {
        UIActionSheet *logoutActionSheet = [[UIActionSheet alloc] init];
        logoutActionSheet.delegate = self;
        [logoutActionSheet addButtonWithTitle:@"ログアウト"];
        [logoutActionSheet addButtonWithTitle:@"キャンセル"];
        [logoutActionSheet setCancelButtonIndex:1];
        
//        [logoutActionSheet showInView:self.viewController.navigationController.view];
        [logoutActionSheet showInView:appDelegate.viewController.view];
        return;
    }
}

#pragma mark - IBAction

- (void)tappedMenu:(id)sender
{
    CMDAppDelegate *appDelegate = (CMDAppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.viewController showLeftPanelAnimated:YES];
}

#pragma mark - UITableViewDateSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CMDHomeTableViewCell"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // ログアウト処理
        
        // rootViewControllerをCMDInitialViewControllerをイニシャライズしてセット
        UIViewController *initialViewController = [_mainStoryboard instantiateViewControllerWithIdentifier:@"CMDInitialViewController"];
        UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        window.rootViewController = initialViewController;
    }
}

#pragma mark - CMDSideMenuDelegate

/*
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
 {
 [self.viewController performSegueWithIdentifier:kCMDStoryBoardSegueSearchFriendIdentifier sender:self];
 break;
 }
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
 */

@end
