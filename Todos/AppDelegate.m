//
//  AppDelegate.m
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import "AppDelegate.h"
#import "TodosViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:TodosViewController.new];
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
