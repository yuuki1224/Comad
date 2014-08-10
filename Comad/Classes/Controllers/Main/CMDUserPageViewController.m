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

// RACSupport
#import "CMDWatchedProductionView+RACSupport.h"
#import "CMDLikeProductionView+RACSupport.h"
#import "CMDWantProductionView+RACSupport.h"

// ViewController
#import "CMDProductionPageViewController.h"
#import "CMDWatchedListViewController.h"
#import "CMDLikeListViewController.h"

#import <ReactiveCocoa/RACEXTScope.h>

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

#pragma mark - Class method

+ (instancetype)userPageViewController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDUserPageViewController class])];
}

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
    
    [self defineReactiveBehaviors];
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
    
    @weakify(self);
    // CMDWatchedProductionView
    [_watchedProductionView.rac_tappedWatchedProductionCellSignal subscribeNext:^(UITableViewCell *cell) {
        @strongify(self);
        CMDWatchedListViewController *watchedListViewController = [CMDWatchedListViewController watchedListViewController];
        [self.navigationController pushViewController:watchedListViewController animated:YES];
    }];
    [_watchedProductionView.rac_tappedOthersCommentSignal subscribeNext:^(id x) {
        @strongify(self);
        CMDWatchedListViewController *watchedListViewController = [CMDWatchedListViewController watchedListViewController];
        [self.navigationController pushViewController:watchedListViewController animated:YES];
    }];
    
    // CMDLikeProductionView
    [_likeProductionView.rac_tappedLikeProductionCellSignal subscribeNext:^(UITableViewCell *cell) {
        @strongify(self);
        CMDLikeListViewController *likeListViewController = [CMDLikeListViewController likeListViewController];
        [self.navigationController pushViewController:likeListViewController animated:YES];
    }];
    [_likeProductionView.rac_tappedOthersLikeProductionSignal subscribeNext:^(id x) {
        @strongify(self);
        CMDLikeListViewController *likeListViewController = [CMDLikeListViewController likeListViewController];
        [self.navigationController pushViewController:likeListViewController animated:YES];
    }];
    
    // CMDWantProductionView
    [_wantProductionView.rac_tappedWantProductionImageSignal subscribeNext:^(id x) {
        @strongify(self);
        CMDProductionPageViewController *productionPageVC = [CMDProductionPageViewController productionPageViewController];
        [self.navigationController pushViewController:productionPageVC animated:YES];
    }];
}

@end
