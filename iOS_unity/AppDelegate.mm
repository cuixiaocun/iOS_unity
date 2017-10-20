//
//  AppDelegate.m
//  iOS_unity
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 桥通天下. All rights reserved.
//


#import "AppDelegate.h"
#import "ViewController.h"
#import "UnityAppController.h"

extern "C" void VuforiaSetGraphicsDevice(void* device, int deviceType, int eventType);
extern "C" void VuforiaRenderEvent(int marker);

@interface AppDelegate ()
{
    UIButton *_backBtn;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    //unity
    self.unityVC = [[UnityAppController alloc] init];
    [self.unityVC application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    UIViewController *homeVC = [[UIViewController alloc] init];
    UINavigationController   *mainNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = mainNav;
    [self.window makeKeyAndVisible];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self.unityVC applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.unityVC applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [self.unityVC applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self.unityVC applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.unityVC applicationWillTerminate:application];
}

#pragma mark -
#pragma mark ---------------unity开启与隐藏
- (UIWindow *)unityWindow
{
    if (!_unityWindow) {
        _unityWindow = UnityGetMainWindow();
    }
    return _unityWindow;
}
- (void)showUnityWindow
{
    [self.unityWindow makeKeyAndVisible];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setImage:[UIImage imageNamed:@"返回icon"] forState:UIControlStateNormal];
    _backBtn.frame =CGRectMake(100, 100, 100, 100);
    [_backBtn setBackgroundColor:[UIColor redColor]];
    [self.unityWindow addSubview:_backBtn];
    [_backBtn addTarget:self action:@selector(hideUnityWindow) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)hideUnityWindow
{
    [self.window makeKeyAndVisible];
}
- (void)shouldAttachRenderDelegate
{
//    UnityRegisterRenderingPlugin(&VuforiaSetGraphicsDevice, &VuforiaRenderEvent);
}

@end

