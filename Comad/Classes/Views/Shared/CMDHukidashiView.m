//
//  CMDHukidashiView.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/09.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDHukidashiView.h"

NSArray * kHukidashiLists;

@implementation CMDHukidashiView

#pragma mark - Class method

+ (instancetype)hukidashiUpperView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *hukidashiViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:@"CMDHukidashiUpperViewController"];
    return (CMDHukidashiView *)hukidashiViewVC.view;
}

+ (instancetype)hukidashiLowerView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *hukidashiViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:@"CMDHukidashiLowerViewController"];
    return (CMDHukidashiView *)hukidashiViewVC.view;
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kHukidashiLists = @[
                        @"この作品微妙だなあ〜",
                        @"今度見る!",
                        @"見たことある!",
                        @"これめっちゃ好き!!",
                        ];
}

#pragma mark - UITableViewDateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [kHukidashiLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CMDChoiceListTableCell"];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [kHukidashiLists objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 37;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
