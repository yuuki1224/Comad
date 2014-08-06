//
//  CMDUserHeaderView.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDUserHeaderView.h"
#import "CMDUserViewModel.h"

@implementation CMDUserHeaderView
{
    CMDUserViewModel *_userViewModel;
}

#pragma mark - Class method

+ (instancetype)userHeaderView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *userHeaderViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDUserHeaderView class])];
    
    return (CMDUserHeaderView *)userHeaderViewVC.view;
}

#pragma mark - LifeCycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Accessor

@dynamic userViewModel;
- (void)setUserViewModel:(CMDUserViewModel *)userViewModel
{
    _userViewModel = userViewModel;
    
    if (_userViewModel) {
        // viewの更新
        
    }
}

- (CMDUserViewModel *)userViewModel
{
    return _userViewModel;
}

@end
