//
//  CMDHomeController.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMDSideMenuView.h"

@interface CMDHomeController : NSObject <CMDSideMenuViewDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITableViewController *viewController;

- (IBAction)tappedMenu:(id)sender;

@end
