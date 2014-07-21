//
//  CMDWantProductionPeopleView.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMDWantProductionPeopleDelegate <NSObject>

- (void)tappedPerson;

@end

@interface CMDWantProductionPeopleView : UIView

@property (weak, nonatomic) id<CMDWantProductionPeopleDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIScrollView *wantProductionPeopleScrollView;

@end
