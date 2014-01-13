//
//  dmProfileViewController.m
//  lolapp
//
//  Created by 解云飞 on 14-1-10.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmProfileViewController.h"

@implementation dmProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - SlideNavigationController Methods 

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

@end
