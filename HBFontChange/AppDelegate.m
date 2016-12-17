//
//  AppDelegate.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "AppDelegate.h"
#import "HBFontChangeVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    HBFontChangeVC *vc = [[HBFontChangeVC alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    
    
    //测试 初始化文字大小
    [self initFontSize];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)initFontSize{

    float titleFont = USERDEFAULT_float(TITLE_FONT);
    if (titleFont==0) {
        //一次性代码
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            //初始化
            NSUserDefaults *fontDefaults = [NSUserDefaults standardUserDefaults];
            //把所用的字体值保存下来
            [fontDefaults setFloat:FONT_TITLE_SIZE forKey:TITLE_FONT];
            [fontDefaults setFloat:FONT_CONTENT_SIZE forKey:CONTENT_FONT];
            [fontDefaults setFloat:FONT_DETAILS_SIZE forKey:DETAILS_FONT];
            [[NSUserDefaults standardUserDefaults] synchronize];
        });

    }
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
