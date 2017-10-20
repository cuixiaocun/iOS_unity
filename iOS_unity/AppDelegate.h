//
//  AppDelegate.h
//  iOS_unity
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 桥通天下. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UnityAppController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic , strong)UIWindow *unityWindow;
@property (nonatomic , strong)UnityAppController *unityVC;

- (void)showUnityWindow;
- (void)hideUnityWindow;
- (void)shouldAttachRenderDelegate;
@end

