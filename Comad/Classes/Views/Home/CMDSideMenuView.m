//
//  CMDSideMenuView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDSideMenuView.h"

static NSString * const kMenuInfoTitleString = @"基本";
static NSString * const kMenuSearchTitleString = @"探す";
static NSString * const kMenuSettingsTitleString = @"設定";

NSArray * kMenuInfoTitles;
NSArray * kMenuSearchTitles;
NSArray * kMenuSettingsTitles;

@implementation CMDSideMenuView

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
    if ([self.delegate respondsToSelector:@selector(sideMenuTapped:)])
    {
        switch (indexPath.section) {
            case 0:
                [self.delegate sideMenuTapped:CMDSideMenuWatchedList];
                break;
            case 1:
                [self.delegate sideMenuTapped:CMDSideMenuAnimeList];
                break;
            case 2:
                [self.delegate sideMenuTapped:CMDSideMenuSettings];
                break;
        }
    }
}

@end
