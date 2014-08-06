//
//  CMDWantProductionView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/24.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWantProductionView.h"

NSArray * kCMDWantProduction;
NSInteger const kCMDWantProductionViewMargin = 8;
NSInteger const kCMDWantProductionViewWidth  = 40;
NSInteger const kCMDWantProductionViewHeight = 40;

NSInteger const kCMDWantProductionCount = 20;

@implementation CMDWantProductionView

#pragma mark - Class method

+ (instancetype)wantProductionView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *wantProductionViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDWantProductionView class])];
    
    return (CMDWantProductionView *)wantProductionViewVC.view;
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kCMDWantProduction = @[
                           @"sampleMovie1",
                           @"sampleMovie2",
                           @"sampleMovie3",
                           @"sampleMovie4",
                           @"sampleMovie5",
                           @"sampleMovie6",
                           ];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat sampleImageY = (CGRectGetHeight(self.wantProductionsScrollView.frame) - kCMDWantProductionViewHeight) / 2;
    
    for (int i=0; i < kCMDWantProductionCount; i++) {
        UIImageView *personImageView = [UIImageView new];
        NSString *personImageName = [kCMDWantProduction objectAtIndex:(i%[kCMDWantProduction count])];
        [personImageView setImage:[UIImage imageNamed:personImageName]];
        [personImageView setFrame:CGRectMake(
                                             kCMDWantProductionViewWidth * i + kCMDWantProductionViewMargin * (i + 1),
                                             sampleImageY,
                                             40,
                                             40
                                             )];
        
        [personImageView setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedProfileImage:)];
        [personImageView addGestureRecognizer:tapGestureRecognizer];
        
        [self.wantProductionsScrollView addSubview:personImageView];
    }
    
    [self.wantProductionsScrollView setContentSize:CGSizeMake(
                                                                   (kCMDWantProductionViewWidth + kCMDWantProductionViewMargin) * kCMDWantProductionCount + kCMDWantProductionViewMargin,
                                                                   CGRectGetHeight(self.wantProductionsScrollView.frame)
                                                                   )];
}

#pragma mark - UITapGestureRecognizer

- (void)tappedProfileImage:(UIGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(tappedWantProductionImageView)]) {
        [self.delegate tappedWantProductionImageView];
    }
}

@end
