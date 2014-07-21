//
//  CMDRelatedProductionView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDRelatedProductionViewDelegate <NSObject>

- (void)tappedRelatedProductionImageView;

@end

@interface CMDRelatedProductionView : UIView

@property (weak, nonatomic) id<CMDRelatedProductionViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *relatedProductionLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *relatedProductionsScrollView;

@end
