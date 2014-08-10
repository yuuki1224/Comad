//
//  CMDWatchedListViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWatchedListViewController.h"

// CoreGraphics Quartzっていうんじゃね
#import <CoreGraphics/CoreGraphics.h>

#import "CMDProductionPageViewController.h"
#import "CMDAppDelegate.h"

#import "CMDHukidashiView.h"

CGFloat const kHukidashiThresholdY = 340;

CGFloat const kHukidashiMarginX = 100;
CGFloat const kHukidashiWidth = 200;
CGFloat const kHukidashiHeight = 200;

@interface CMDWatchedListViewController ()
{
    UIView *_backView;
}

@end

@implementation CMDWatchedListViewController

#pragma mark - Class method

+ (instancetype)watchedListViewController
{
    UIStoryboard *listStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardListIdentifier bundle:nil];
    return [listStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDWatchedListViewController class])];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScreen *mainScreen = [UIScreen mainScreen];
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(mainScreen.bounds), CGRectGetHeight(mainScreen.bounds))];
    [_backView setBackgroundColor:[UIColor blackColor]];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedBackView:)];
    [_backView addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (CGRect)p_longTappedCellRect:(CGRect)longTappedCellRect WithOffset:(CGPoint)offset
{
    CGFloat currentTappedCellY = CGRectGetMinY(longTappedCellRect) - offset.y;
    
    CGRect currentTappedCellRect = CGRectMake(CGRectGetMinX(longTappedCellRect), currentTappedCellY, CGRectGetWidth(longTappedCellRect), CGRectGetHeight(longTappedCellRect));
    
    return currentTappedCellRect;
}

- (CMDHukidashiView *)p_hukidashiView:(CGRect)longTappedRect
{
    // TODO: Delete MagicNumber
    CMDHukidashiView *hukidashiView;
    if (CGRectGetMinY(longTappedRect) > kHukidashiThresholdY) {
        hukidashiView = [CMDHukidashiView hukidashiUpperView];
        hukidashiView.frame = CGRectMake(kHukidashiMarginX,
                                         CGRectGetMinY(longTappedRect) - kHukidashiHeight + 23,
                                         kHukidashiWidth,
                                         kHukidashiHeight);
    } else {
        hukidashiView = [CMDHukidashiView hukidashiLowerView];
        hukidashiView.frame = CGRectMake(kHukidashiMarginX,
                                         CGRectGetMinY(longTappedRect) + CGRectGetHeight(longTappedRect),
                                         kHukidashiWidth,
                                         kHukidashiHeight);
    }
    
    return hukidashiView;
}

#pragma mark - UITableViewDateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CMDWatchedListTableCell"];
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressCell:)];
    
    [cell addGestureRecognizer:longPressGestureRecognizer];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMDProductionPageViewController *productionPageViewController = [CMDProductionPageViewController productionPageViewController];
    [self.navigationController pushViewController:productionPageViewController animated:YES];
}

#pragma mark - UILongPressGestureRecognizer

- (void)longPressCell:(id)sender
{
    // TODO: Considering about Memory
    UILongPressGestureRecognizer *longPressGestureRecognizer = (UILongPressGestureRecognizer *)sender;
    
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        for (UIView *subView in _backView.subviews) {
            [subView removeFromSuperview];
        }
        [_backView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
        CMDAppDelegate *appDelegate = (CMDAppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate.viewController.view addSubview:_backView];
        
        CGRect longTappedRect = [self p_longTappedCellRect:longPressGestureRecognizer.view.frame WithOffset:self.watchedListTable.contentOffset];
        CMDHukidashiView *hukidashiView = [self p_hukidashiView:longTappedRect];
        [_backView addSubview:hukidashiView];
        
        [UIView animateWithDuration:0.2 animations:^{
            [_backView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.15]];
        }];
    } else if (longPressGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
    }
}

#pragma mark - UITapGestureRecognizer

- (void)tappedBackView:(id)sender
{
    UITapGestureRecognizer *tapGestureRecognizer = (UITapGestureRecognizer *)sender;
    
    [_backView removeFromSuperview];
}

@end
