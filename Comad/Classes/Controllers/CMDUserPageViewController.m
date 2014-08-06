//
//  CMDUserPageViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/06.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDUserPageViewController.h"

// ViewModel
#import "CMDUserPageViewModel.h"
#import "CMDUserViewModel.h"

// CustomView
#import "CMDUserHeaderView.h"
#import "CMDWatchedProductionView.h"
#import "CMDLikeProductionView.h"
#import "CMDWantProductionView.h"

@interface CMDUserPageViewController ()
{
    CMDUserPageViewModel *_userPageViewModel;
    
    CMDUserHeaderView *_userHeaderView;
    CMDWatchedProductionView *_watchedProductionView;
    CMDLikeProductionView *_likeProductionView;
    CMDWantProductionView *_wantProductionView;
}

@end

@implementation CMDUserPageViewController

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    _userPageViewModel = [[CMDUserPageViewModel alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userHeaderView = [CMDUserHeaderView userHeaderView];
    _userHeaderView.frame = CGRectMake(0, 0, 320, 120);
    _userHeaderView.userViewModel = [[CMDUserViewModel alloc] init];
    [self.contentScrollView addSubview:_userHeaderView];
    
    _watchedProductionView = [CMDWatchedProductionView watchedProductionView];
    _watchedProductionView.frame = CGRectMake(0, 130, 320, 173);
    [self.contentScrollView addSubview:_watchedProductionView];
    
    _likeProductionView = [CMDLikeProductionView likeProductionView];
    _likeProductionView.frame = CGRectMake(0, 303, 320, 173);
    [self.contentScrollView addSubview:_likeProductionView];
    
    _wantProductionView = [CMDWantProductionView wantProductionView];
    _wantProductionView.frame = CGRectMake(0, 476, 320, 100);
    [self.contentScrollView addSubview:_wantProductionView];
    
    self.contentScrollView.contentSize = CGSizeMake(320, 597);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Accessor

@dynamic userPageViewModel;
- (void)setUserPageViewModel:(CMDUserPageViewModel *)userPageViewModel
{
    _userPageViewModel = userPageViewModel;
    
    if (_userPageViewModel != nil) {
        [self defineReactiveBehaviors];
    }
}

- (CMDUserPageViewModel *)userPageViewModel
{
    return _userPageViewModel;
}

#pragma mark - Set Reactive Behavior

- (void)defineReactiveBehaviors
{
    // ViewModelがCustomViewに表示するデータを持っててここでセットしたらいいんじゃね?
    // ActionとかもViewModelに持たせとく必要がある.
}

@end