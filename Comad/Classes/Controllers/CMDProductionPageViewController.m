//
//  CMDProductionPageViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDProductionPageViewController.h"

// CustomeView
#import "CMDProductionDescriptionView.h"
//#import "CMDProductionCommentView.h"
//#import "CMDRelatedProductionView.h"
//#import "CMDWantProductionPeopleView.h"

@interface CMDProductionPageViewController ()
{
    CMDProductionDescriptionView *_productionDescriptionView;
    CMDProductionCommentView     *_commentView;
    CMDRelatedProductionView     *_relatedProductionView;
    CMDWantProductionPeopleView  *_wantProductionPeopleView;
}

@end

@implementation CMDProductionPageViewController

#pragma mark - Class method

+ (instancetype)productionPageViewController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDProductionPageViewController class])];
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    _productionDescriptionView = [CMDProductionDescriptionView productionDescriptionView];
    
    _commentView = [CMDProductionCommentView productionCommentView];
    _commentView.delegate = self;
    
    _relatedProductionView = [CMDRelatedProductionView relatedProductionView];
    _relatedProductionView.delegate = self;
    
    _wantProductionPeopleView = [CMDWantProductionPeopleView wantProductionPeopleView];
    _wantProductionPeopleView.delegate = self;
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
    
    [_wantProductionPeopleView setFrame:CGRectMake(0, 574, 320, 80)];
    [self.contentScrollView addSubview:_wantProductionPeopleView];
    
    self.contentScrollView.contentSize = CGSizeMake(320, 670);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

#pragma mark - CMDProductionCommentViewDelegate

- (void)tappedCommentCell:(UITableViewCell *)cell
{
    [self performSegueWithIdentifier:@"CMDProductionCommentListSegue" sender:self];
}

- (void)tappedOthersComment
{
    
}

#pragma mark - CMDRelatedProductionViewDelegate

- (void)tappedRelatedProductionImageView
{
    // ここでUIViewControllerのpushの循環を作ってみます.
    NSLog(@"viewControllers: %@", self.navigationController.viewControllers);
    NSLog(@"count: %d", [self.navigationController.viewControllers count]);
    
    UIViewController *relatedProductionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CMDProductionPageViewController"];
    [self.navigationController pushViewController:relatedProductionVC animated:YES];
}

#pragma mark - CMDWantProductionPeopleViewDelegate

- (void)tappedPerson
{
    [self performSegueWithIdentifier:@"CMDUserPageSegue" sender:self];
}

@end
