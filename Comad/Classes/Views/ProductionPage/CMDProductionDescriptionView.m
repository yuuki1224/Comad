//
//  CMDProductionDescriptionView.m
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDProductionDescriptionView.h"

@implementation CMDProductionDescriptionView

#pragma mark - Class method

+ (instancetype)productionDescriptionView
{
    UIStoryboard *customViewStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardCustomViewIdentifier bundle:nil];
    UIViewController *productionDescriptionViewVC = [customViewStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    
    return (CMDProductionDescriptionView *)productionDescriptionViewVC.view;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
