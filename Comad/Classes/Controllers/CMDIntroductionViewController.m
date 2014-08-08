//
//  CMDIntroductionViewController.m
//  Comad
//
//  Created by AsanoYuki on 2014/08/08.
//  Copyright (c) 2014年 AsanoYuki. All rights reserved.
//

#import "CMDIntroductionViewController.h"
#import "CMDAppDelegate.h"

@interface CMDIntroductionViewController ()

@end

@implementation CMDIntroductionViewController

#pragma mark - Class method

+ (instancetype)introductionViewController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kCMDStoryBoardMainIdentifier bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([CMDIntroductionViewController class])];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedFacebookLogin:(id)sender {
    CMDAppDelegate *appDelegate = (CMDAppDelegate *)[UIApplication sharedApplication].delegate;
    [self presentViewController:appDelegate.viewController animated:YES completion:^{
    }];
//    appDelegate.window.rootViewController = appDelegate.viewController;
}
@end
