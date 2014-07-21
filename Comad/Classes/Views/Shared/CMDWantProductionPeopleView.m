//
//  CMDWantProductionPeopleView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDWantProductionPeopleView.h"

NSArray * kCMDWantProductionPeople;
NSInteger const kCMDWantProductionPeopleViewMargin = 8;
NSInteger const kCMDWantProductionPeopleViewWidth  = 40;
NSInteger const kCMDWantProductionPeopleViewHeight = 40;

NSInteger const kCMDWantProductionPeopleCount = 60;

@implementation CMDWantProductionPeopleView
{
}

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kCMDWantProductionPeople = @[
                                 @"sampleProfileImage1",
                                 @"sampleProfileImage2",
                                 @"sampleProfileImage3",
                                 @"sampleProfileImage4",
                                 ];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat sampleImageY = (CGRectGetHeight(self.wantProductionPeopleScrollView.frame) - kCMDWantProductionPeopleViewHeight) / 2;
    
    for (int i=0; i < kCMDWantProductionPeopleCount; i++) {
        UIImageView *personImageView = [UIImageView new];
        NSString *personImageName = [kCMDWantProductionPeople objectAtIndex:(i%[kCMDWantProductionPeople count])];
        [personImageView setImage:[UIImage imageNamed:personImageName]];
        [personImageView setFrame:CGRectMake(
                                             kCMDWantProductionPeopleViewWidth * i + kCMDWantProductionPeopleViewMargin * (i + 1),
                                             sampleImageY,
                                             40,
                                             40
                                             )];
        
        [personImageView setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedProfileImage:)];
        [personImageView addGestureRecognizer:tapGestureRecognizer];
        
        [self.wantProductionPeopleScrollView addSubview:personImageView];
    }
    
    [self.wantProductionPeopleScrollView setContentSize:CGSizeMake(
                                                                  (kCMDWantProductionPeopleViewWidth + kCMDWantProductionPeopleViewMargin) * kCMDWantProductionPeopleCount + kCMDWantProductionPeopleViewMargin,
                                                                  CGRectGetHeight(self.wantProductionPeopleScrollView.frame)
                                                                   )];
}

#pragma mark - UIGestureRecognizer

- (void)tappedProfileImage:(UIGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(tappedProfileImage:)]) {
        [self.delegate tappedPerson];
    }
}

@end
