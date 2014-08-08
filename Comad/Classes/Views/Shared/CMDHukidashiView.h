//
//  CMDHukidashiView.h
//  Comad
//
//  Created by AsanoYuki on 2014/08/09.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDHukidashiView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *choiceListTable;

+ (instancetype)hukidashiView;

@end
