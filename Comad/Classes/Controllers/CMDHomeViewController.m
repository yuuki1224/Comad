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
#import "CMDProductionPageViewController.h"

NSArray * kHomeTableViewTestCells;

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
    kHomeTableViewTestCells = @[
                                @{
                                    @"productionImage": @"sampleMovie6",
                                    @"productionName": @"トランセンデンス",
                                    @"personImage": @"sampleProfileImage1",
                                    },
                                @{
                                    @"productionImage": @"sampleAnime1",
                                    @"productionName": @"六畳間の侵略者!?",
                                    @"personImage": @"sampleProfileImage2",
                                    },
                                @{
                                    @"productionImage": @"sampleDrama1",
                                    @"productionName": @"家族狩り",
                                    @"personImage": @"sampleProfileImage3",
                                    },
                                @{
                                    @"productionImage": @"sampleMovie4",
                                    @"productionName": @"ノアの箱舟",
                                    @"personImage": @"sampleProfileImage4",
                                    },
                                @{
                                    @"productionImage": @"sampleDrama3",
                                    @"productionName": @"GTO",
                                    @"personImage": @"sampleProfileImage1",
                                    },
                                @{
                                    @"productionImage": @"sampleAnime2",
                                    @"productionName": @"Free!!!",
                                    @"personImage": @"sampleProfileImage2",
                                    },
                                @{
                                    @"productionImage": @"sampleDrama5",
                                    @"productionName": @"同窓生 〜人は3度恋をする〜",
                                    @"personImage": @"sampleProfileImage3",
                                    },
                                @{
                                    @"productionImage": @"sampleMovie1",
                                    @"productionName": @"私のハワイの歩き方",
                                    @"personImage": @"sampleProfileImage4",
                                    },
                                ];
    
    // storyboardインスタンス化
    _mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    _productionListStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardProductionListIdentifier bundle:nil];
    _customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    _settingsStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardSettingsIdentifier bundle:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(receivedSideBarNotification:) name:kCMDNotificationSideMenu object:nil];
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
    [appDelegate.viewController showCenterPanelAnimated:YES];
    
    NSDictionary *userInfo = notification.userInfo;
    NSNumber *cellTypeNumber = (NSNumber *)userInfo[@"tappedCell"];
    CMDSideMenuCell cellType = [cellTypeNumber intValue];
    
    if (cellType == CMDSideMenuLogout) {
        UIActionSheet *logoutActionSheet = [[UIActionSheet alloc] init];
        logoutActionSheet.delegate = self;
        [logoutActionSheet addButtonWithTitle:@"ログアウト"];
        [logoutActionSheet addButtonWithTitle:@"キャンセル"];
        [logoutActionSheet setCancelButtonIndex:1];
        
        [logoutActionSheet showInView:appDelegate.viewController.view];
        return;
    }
    
     // Segue呼び出し
     switch (cellType) {
             case CMDSideMenuUserPage:
             {
                 [self performSegueWithIdentifier:kCMDStoryBoardSegueUserIdentifier sender:self];
                 break;
             }
             case CMDSideMenuCellHome:
                 break;
             case CMDSideMenuWatchedList:
             {
                 UIViewController *watchedListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDWatchedListViewController"];
                 [self.navigationController pushViewController:watchedListViewController animated:YES];
                 break;
             }
             case CMDSideMenuFavoriteList:
             {
                 UIViewController *favoriteListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDFavoriteListViewController"];
                 [self.navigationController pushViewController:favoriteListViewController animated:YES];
                 break;
             }
             case CMDSideMenuWantList:
             {
                 UIViewController *wantListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDWantListViewController"];
                 [self.navigationController pushViewController:wantListViewController animated:YES];
                 break;
             }
             case CMDSideMenuFriendRelatedList:
             {
                 UIViewController *friendRelatedListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDFriendRelatedListViewController"];
                 [self.navigationController pushViewController:friendRelatedListViewController animated:YES];
                 break;
             }
             case CMDSideMenuFollow:
                 [self performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
                 break;
             case CMDSideMenuFollower:
                 [self performSegueWithIdentifier:@"CMDFollowSegue" sender:self];
                 break;
             case CMDSideMenuSeachFriend:
             {
                 [self performSegueWithIdentifier:kCMDStoryBoardSegueSearchFriendIdentifier sender:self];
                 break;
             }
             case CMDSideMenuAnimeList:
             {
                 UIViewController *animeListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDAnimeListViewController"];
                 [self.navigationController pushViewController:animeListViewController animated:YES];
                 break;
             }
             case CMDSideMenuNotPublicAnimeList:
             {
                 UIViewController *animeListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDAnimeListViewController"];
                 [self.navigationController pushViewController:animeListViewController animated:YES];
                 break;
             }
             case CMDSideMenuMovieList:
             {
                 UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
                 [self.navigationController pushViewController:movieListViewController animated:YES];
                 break;
             }
             case CMDSideMenuFridayMovieList:
             {
                 UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
                 [self.navigationController pushViewController:movieListViewController animated:YES];
                 break;
             }
             case CMDSideMenuNotPublicMovieList:
             {
                 UIViewController *movieListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDMovieListViewController"];
                 [self.navigationController pushViewController:movieListViewController animated:YES];
                 break;
             }
             case CMDSideMenuDramaList:
             {
                 UIViewController *dramaListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDDramaListViewController"];
                 [self.navigationController pushViewController:dramaListViewController animated:YES];
                 break;
             }
             case CMDSideMenuNotPublicDramaList:
             {
                 UIViewController *dramaListViewController = [_productionListStoryboard instantiateViewControllerWithIdentifier:@"CMDDramaListViewController"];
                 [self.navigationController pushViewController:dramaListViewController animated:YES];
                 break;
             }
             case CMDSideMenuSettings:
             {
                 UIViewController *settingsViewController = [_settingsStoryboard instantiateViewControllerWithIdentifier:@"CMDSettingsViewController"];
                 [self.navigationController pushViewController:settingsViewController animated:YES];
                 break;
             }
             default:
             break;
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
    return [kHomeTableViewTestCells count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CMDHomeTableViewCell"];
    
    NSString *productionImageName = [kHomeTableViewTestCells[indexPath.row] valueForKey:@"productionImage"];
    NSString *productionName = [kHomeTableViewTestCells[indexPath.row] valueForKey:@"productionName"];
    NSString *personImageName = [kHomeTableViewTestCells[indexPath.row] valueForKey:@"personImage"];
    
    UIImageView *productionImageView = (UIImageView *)[cell viewWithTag:1];
    [productionImageView setImage:[UIImage imageNamed:productionImageName]];
    UILabel *productionNameLabel = (UILabel *)[cell viewWithTag:2];
    [productionNameLabel setText:productionName];
    UIImageView *profileImageView = (UIImageView *)[cell viewWithTag:3];
    [profileImageView setImage:[UIImage imageNamed:personImageName]];
    
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
    CMDProductionPageViewController *productionPageViewController = [CMDProductionPageViewController productionPageViewController];
    [self.navigationController pushViewController:productionPageViewController animated:YES];
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
 
 }
 */

@end
