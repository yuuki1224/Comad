//
//  CMDRelatedProductionView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDRelatedProductionView.h"

NSArray * kCMDRelatedProductions;
NSInteger const kCMDRelatedProductionViewMargin = 8;
NSInteger const kCMDRelatedProductionViewWidth  = 50;
NSInteger const kCMDRelatedProductionViewHeight = 50;

NSInteger const kCMDRelatedProductionViewCount = 20;

@implementation CMDRelatedProductionView

#pragma mark - LifeCycle

- (void)awakeFromNib
{
    kCMDRelatedProductions = @[
                               @"sampleAnime1",
                               @"sampleAnime2",
                               @"sampleAnime3",
                               @"sampleMovie1",
                               @"sampleMovie2",
                               @"sampleMovie3",
                               ];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat sampleImageY = (CGRectGetHeight(self.relatedProductionsScrollView.frame) - kCMDRelatedProductionViewHeight) / 2;
    
    for (int i=0; i < kCMDRelatedProductionViewCount; i++) {
        UIImageView *sampleProductionImage = [UIImageView new];
        [sampleProductionImage setImage:[UIImage imageNamed:[kCMDRelatedProductions objectAtIndex:i%[kCMDRelatedProductions count]]]];
        [sampleProductionImage setFrame:CGRectMake(
                                                  kCMDRelatedProductionViewMargin * (i + 1) + kCMDRelatedProductionViewWidth * i,
                                                  sampleImageY,
                                                  kCMDRelatedProductionViewWidth,
                                                  kCMDRelatedProductionViewHeight
                                                  )];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedProductionImageView:)];
        [sampleProductionImage setUserInteractionEnabled:YES];
        [sampleProductionImage addGestureRecognizer:tapGestureRecognizer];
        
        [self.relatedProductionsScrollView addSubview:sampleProductionImage];
    }
    
    [self.relatedProductionsScrollView setContentSize:CGSizeMake(
                                                                 kCMDRelatedProductionViewWidth * 2 + kCMDRelatedProductionViewWidth * kCMDRelatedProductionViewCount,
                                                                 CGRectGetHeight(self.relatedProductionsScrollView.frame))];
}

#pragma mark - UITapGestureRecognizer

- (void)tappedProductionImageView:(UIGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(tappedProductionImageView:)]) {
        [self.delegate tappedRelatedProductionImageView];
    }
}

@end
