//
//  CMDWantProductionPeopleView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDWantProductionPeopleViewDelegate <NSObject>

- (void)tappedPerson;

@end

@interface CMDWantProductionPeopleView : UIView

@property (weak, nonatomic) id<CMDWantProductionPeopleViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIScrollView *wantProductionPeopleScrollView;

+ (instancetype)wantProductionPeopleView;

@end
