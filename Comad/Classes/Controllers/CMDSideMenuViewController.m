//
//  CMDSideMenuViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDSideMenuViewController.h"

static NSString * const kMenuInfoTitleString = @"基本";
static NSString * const kMenuSearchTitleString = @"探す";
static NSString * const kMenuSettingsTitleString = @"設定";

NSArray * kMenuInfoTitles;
NSArray * kMenuSearchTitles;
NSArray * kMenuSettingsTitles;

@interface CMDSideMenuViewController ()

@end

@implementation CMDSideMenuViewController

#pragma mark - Class method

+ (instancetype)sideMenuViewController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDSideMenuViewController class])];
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kMenuInfoTitles     = @[
                            @"ホーム",
                            @"見た! 一覧(200)",
                            @"お気に入り(100)",
                            @"見たい! 一覧(150)",
                            @"友達関連の作品",
                            @"フォロー(20)",
                            @"フォロワー(14)",
                            @"友達を探す",
                            ];
    kMenuSearchTitles   = @[
                            @"アニメ一覧",
                            @"未放映アニメ一覧",
                            @"映画一覧",
                            @"直近の金曜ロードショー",
                            @"未公開映画一覧",
                            @"ドラマ一覧",
                            @"未放映ドラマ一覧",
                            ];
    kMenuSettingsTitles = @[
                            @"設定",
                            @"ログアウト",
                            ];
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

#pragma mark - Private

- (CMDSideMenuCell)p_cellTypeWithIndexPath:(NSIndexPath *)indexPath
{
    CMDSideMenuCell cellType = 0;
    switch (indexPath.section) {
        case 0:
            cellType = indexPath.row + 1;
            break;
        case 1:
            cellType = indexPath.row + [kMenuInfoTitles count] + 1;
            break;
        case 2:
            cellType = indexPath.row + [kMenuInfoTitles count] + [kMenuSearchTitles count] + 1;
            break;
    }
    
    return cellType;
}

#pragma mark - IBAction

- (void)tappedUserImage:(id)sender
{
    // Notificationにするのがいいかと
    /*
    if ([self.delegate respondsToSelector:@selector(sideMenuTapped:)]) {
        [self.delegate sideMenuTapped:CMDSideMenuUserPage];
    }
     */
}

#pragma mark - UITableView DateSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [kMenuInfoTitles count];
            break;
        case 1:
            return [kMenuSearchTitles count];
            break;
        case 2:
            return [kMenuSettingsTitles count];
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.sideMenuTabel dequeueReusableCellWithIdentifier:@"CMDSideMenuTableCell"];
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    
    switch (indexPath.section) {
        case 0:
            cellLabel.text = [kMenuInfoTitles objectAtIndex:indexPath.row];
            break;
        case 1:
            cellLabel.text = [kMenuSearchTitles objectAtIndex:indexPath.row];
            break;
        case 2:
            cellLabel.text = [kMenuSettingsTitles objectAtIndex:indexPath.row];
            break;
    }
    [cellLabel sizeToFit];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return kMenuInfoTitleString;
            break;
        case 1:
            return kMenuSearchTitleString;
            break;
        case 2:
            return kMenuSettingsTitleString;
            break;
        default:
            break;
    }
    return @"";
}

#pragma mark - UITabelView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:kCMDNotificationSideMenu
                                      object:self
                                    userInfo:@{
                                               @"tappedCell": @([self p_cellTypeWithIndexPath:indexPath]),
                                               }];
    
    /*
    if ([self.delegate respondsToSelector:@selector(sideMenuTapped:)])
    {
        [self.delegate sideMenuTapped:[self p_cellTypeWithIndexPath:indexPath]];
    }
     */
}

@end
