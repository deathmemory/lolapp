//
//  dmAppDelegate.m
//  lolapp
//
//  Created by 解云飞 on 14-1-10.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmAppDelegate.h"
#import "ContentsViewController.h"

@implementation dmAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    

//    dmMenuViewController* rightMenu = (dmMenuViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"dmMenuViewController"];
//    rightMenu.view.backgroundColor = [UIColor yellowColor];                                                                                                                                                                                                                                                             
//    rightMenu.cellIdentifier = @"rightMenuCell";

    dmMenuViewController* leftMenu = (dmMenuViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"dmMenuViewController"];
    leftMenu.view.backgroundColor = [UIColor lightGrayColor];
    leftMenu.cellIdentifier = @"leftMenuCell";
//    [SlideNavigationController sharedInstance].righMenu = rightMenu;
    SlideNavigationController* slideNavigationCtrl = [SlideNavigationController sharedInstance];
    slideNavigationCtrl.leftMenu = leftMenu;

    // 透明度设置为0.3
    slideNavigationCtrl.navigationBar.alpha = 1.0;
    // 元素背景设置为黑色
//    slideNavigationCtrl.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
    // 设置为半透明
    slideNavigationCtrl.navigationBar.translucent = NO;
    /*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];	
    // Override point for customization after application launch.
    ContentsViewController* viewController = [[ContentsViewController alloc] initWithNibName:@"ContentsViewController" bundle:nil];
    //[[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    */
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
