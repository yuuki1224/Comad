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
NSInteger const kCMDRelatedProductionViewWidth = 50;
NSInteger const kCMDRelatedProductionViewHeight = 50;

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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGFloat sampleImageY = (CGRectGetHeight(self.relatedProductionsScrollView.frame) - kCMDRelatedProductionViewHeight) / 2;
    
    // Drawing code
    for (int i=0; i < [kCMDRelatedProductions count]; i++) {
        UIImageView *sampleProductionImage = [UIImageView new];
        [sampleProductionImage setImage:[UIImage imageNamed:[kCMDRelatedProductions objectAtIndex:i]]];
        [sampleProductionImage setFrame:CGRectMake(
                                                  kCMDRelatedProductionViewMargin * (i + 1) + kCMDRelatedProductionViewWidth * i,
                                                  sampleImageY,
                                                  kCMDRelatedProductionViewWidth,
                                                  kCMDRelatedProductionViewHeight
                                                  )];
        [self.relatedProductionsScrollView addSubview:sampleProductionImage];
    }
    
    [self.relatedProductionsScrollView setContentSize:CGSizeMake(
                                                                 kCMDRelatedProductionViewWidth * 2 + kCMDRelatedProductionViewWidth * [kCMDRelatedProductions count],
                                                                 CGRectGetHeight(self.relatedProductionsScrollView.frame))];
}

@end
