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
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    UIViewController *sideMenuVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CMDSideMenuView"];
    
    _sideMenu = (CMDSideMenuView *)sideMenuVC.view;
    _sideMenu.frame = CGRectMake(-280, 0, 280, 568);
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.5;
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackView:)];
    [_backView addGestureRecognizer:_tapGestureRecognizer];
}

#pragma mark - UITapGestureRecognizer Action

- (void)tapBackView:(UITapGestureRecognizer *)sender
{
    [_backView removeFromSuperview];
    [UIView animateWithDuration:0.1 animations:^{
        _sideMenu.frame = CGRectMake(-280, 0, 280, 568);
    }];
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
    // Segue呼び出し
}

@end