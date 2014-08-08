//
//  CMDWatchedListViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWatchedListViewController.h"

#import "CMDProductionPageViewController.h"

@interface CMDWatchedListViewController ()

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

@end
