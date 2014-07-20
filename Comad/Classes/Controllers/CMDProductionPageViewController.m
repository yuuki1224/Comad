//
//  CMDProductionPageViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDProductionPageViewController.h"
#import "CMDProductionDescriptionView.h"
#import "CMDProductionCommentView.h"

@interface CMDProductionPageViewController ()
{
    CMDProductionDescriptionView *_productionDescriptionView;
    CMDProductionCommentView *_commentView;
}

@end

@implementation CMDProductionPageViewController

- (void)awakeFromNib
{
    UIStoryboard *mainStoryBoard = self.storyboard;
    
    UIViewController *productionDescriptionVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CMDProductionDescriptionView"];
    _productionDescriptionView = (CMDProductionDescriptionView *)productionDescriptionVC.view;
    
    UIViewController *productionCommentVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CMDProductionCommentView"];
    _commentView = (CMDProductionCommentView *)productionCommentVC.view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _productionDescriptionView.frame = CGRectMake(0, 0, 320, 300);
    [self.contentScrollView addSubview:_productionDescriptionView];
    
    _commentView.frame = CGRectMake(0, 300, 320, 172);
    [self.contentScrollView addSubview:_commentView];
    
    self.contentScrollView.contentSize = CGSizeMake(320, 1000);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

@end
