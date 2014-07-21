//
//  CMDProductionCommentView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDProductionCommentView.h"

NSArray *kCMDProductionCommentCells;

@implementation CMDProductionCommentView

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kCMDProductionCommentCells = @[
                                   @{
                                       @"image": @"sampleProfileImage2",
                                       @"comment": @"めっちゃおもろかった。人工知能について勉強欲が高まった。",
                                       },
                                   @{
                                       @"image": @"sampleProfileImage3",
                                       @"comment": @"ばりおもろかった!!!!!!",
                                       },
                                   ];
}

#pragma mark - UITableViewDateSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
        case 1: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CMDProductionCommentTableCell" forIndexPath:indexPath];
            
            NSDictionary *sampleCellInfo = [kCMDProductionCommentCells objectAtIndex:indexPath.row];
            UIImageView *cellImage = (UIImageView *)[cell viewWithTag:1];
            UIImage *image = [UIImage imageNamed:[sampleCellInfo objectForKey:@"image"]];
            [cellImage setImage:image];
            
            UILabel *commentLabel = (UILabel *)[cell viewWithTag:2];
            commentLabel.text = [sampleCellInfo objectForKey:@"comment"];
            
            break;
        }
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CMDProductionCommentTableShowOthersCell" forIndexPath:indexPath];
            break;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"コメント";
}

#pragma mark - UITableViewDelegate

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
    if ([self.delegate respondsToSelector:@selector(tappedCommentCell:)]) {
        [self.delegate tappedCommentCell:[tableView cellForRowAtIndexPath:indexPath]];
    }
}

@end
