//
//  AppDelegate.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/1.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLAppDelegate.h"
#import "NLLoginGuideViewController.h"
#import "NLBaseTabBarViewController.h"
#import "NLBaseNavigationVC.h"
//#import "NLRegisterViewController.h"
//#import "NLGetCodeViewController.h"
//#import "NLPasswordViewController.h"
//#import "NLChooseSexViewController.h"
//#import "NLChooseBodyViewController.h"
//#import "NLLoginViewController.h"

@interface NLAppDelegate ()

@end

@implementation NLAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NLBaseTabBarViewController *tabBarVC = [[NLBaseTabBarViewController alloc]init];
    
    NLLoginGuideViewController*tabBarVC = [[NLLoginGuideViewController alloc]init];
    NLBaseNavigationVC *nav = [[NLBaseNavigationVC alloc]initWithRootViewController:tabBarVC];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = nav ;
    [self.window   makeKeyAndVisible];
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
