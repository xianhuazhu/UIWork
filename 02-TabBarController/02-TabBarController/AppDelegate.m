//
//  AppDelegate.m
//  02-TabBarController
//
//  Created by qingyun on 15/11/24.
//  Copyright © 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "QYContactViewController.h"
#import "QYGrpViewController.h"
#import "QYMesgViewController.h"
#import "QYMoreViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor grayColor];
    window.hidden = NO;
    self.window = window;
    
    //1.创建一个UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate = self;
    
    //2.建立个标签页的控制器，并加入到数组中
    QYMesgViewController *msgVC = [[QYMesgViewController alloc] init];
    QYContactViewController *contacVC = [[QYContactViewController alloc] init];
    QYGrpViewController *grpVC = [[QYGrpViewController alloc] init];
    QYMoreViewController *moreVC = [[QYMoreViewController alloc] init];
    
    NSArray *viewController = @[msgVC, contacVC, grpVC, moreVC];
    //3.将数组赋值给tabController的viewControllers属性
    tabBarController.viewControllers = viewController;
    //4.绑定window的rootViewController
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.tabBarItem.badgeValue = nil;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
   NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (index == 2) {
        return NO;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
