//
//  AppDelegate.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    //此为找到plist文件中得版本号所对应的键 一般不知道这个健
//    
//    NSString *key = (NSString *)kCFBundleVersionKey;
//    
//    // 1.从plist中取出版本号
//    
//    NSString *version = [NSBundle mainBundle].infoDictionary[key];
//    
//    // 2.从沙盒中取出上次存储的版本号
//    
//    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    
//    if([version isEqualToString:saveVersion]) {
//        
//        //不是第一次使用这个
//        NSLog(@"---不是第一次--");
//        
//    }else{
//        //版本号不一样：第一次使用新版本
//        
//        //将新版本号写入沙盒
//        
//        [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
//        
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        //显示版本新特性界面
//        NSLog(@"---第一次--");
//        
//    }
    
    
    
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
