//
//  CMDHomeViewController.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/07.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDHomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

- (IBAction)tappedMenu:(id)sender;

+ (id)navigationController;

@end
