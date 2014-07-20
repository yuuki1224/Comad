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
#import "CMDRelatedProductionView.h"

@interface CMDProductionPageViewController ()
{
    CMDProductionDescriptionView *_productionDescriptionView;
    CMDProductionCommentView *_commentView;
    CMDRelatedProductionView *_relatedProductionView;
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
    
    UIViewController *relatedProductionVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CMDRelatedProductionView"];
    _relatedProductionView = (CMDRelatedProductionView *)relatedProductionVC.view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_productionDescriptionView setFrame:CGRectMake(0, 0, 320, 300)];
    [self.contentScrollView addSubview:_productionDescriptionView];
    
    [_commentView setFrame:CGRectMake(0, 300, 320, 172)];
    [self.contentScrollView addSubview:_commentView];
    
    [_relatedProductionView setFrame:CGRectMake(0, 474, 320, 100)];
    [self.contentScrollView addSubview:_relatedProductionView];
    
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
