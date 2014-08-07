//
//  CMDHomeController.h
//  Comad
//
//  Created by AsanoYuki on 2014/07/20.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDHomeController : NSObject <UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITableViewController *viewController;

- (IBAction)tappedMenu:(id)sender;

+ (id)navigationViewController;

@end
