//
//  CMDLikeProductionView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDLikeProductionView.h"

@implementation CMDLikeProductionView

#pragma mark - Class method

+ (instancetype)likeProductionView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *likeProductionViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDLikeProductionView class])];
    
    return (CMDLikeProductionView *)likeProductionViewVC.view;
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
}

#pragma mark - UITableView DateSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSString *cellIdentifier;
    switch (indexPath.row) {
        case 0:
        case 1:
            cellIdentifier = @"CMDProductionCommentTableCell";
            break;
        case 2:
            cellIdentifier = @"CMDProductionCommentTableShowOthersCell";
            break;
        default:
            break;
    }
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"好きな作品";
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        case 1:
            return 55;
            break;
        case 2:
            return 40;
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        case 1:
        {
            if ([self.delegate respondsToSelector:@selector(tappedLikeProductionCell:)]) {
                [self.delegate tappedLikeProductionCell:[tableView cellForRowAtIndexPath:indexPath]];
            }
            break;
        }
        case 2:
        {
            if ([self.delegate respondsToSelector:@selector(tappedOthersLikeProduction)]) {
                [self.delegate tappedOthersLikeProduction];
            }
            break;
        }
        default:
            break;
    }
}

@end
