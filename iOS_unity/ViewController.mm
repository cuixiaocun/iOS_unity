//
//  ViewController.m
//  iOS_unity
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 桥通天下. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()///
{
    UIButton *_backBtn;
}
//@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;
@property (nonatomic , strong)UnityAppController *unityVC;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor greenColor];
    vc.view.frame = [UIScreen mainScreen].bounds;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(70, 530, 180, 30)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"跳转到Unity界面" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(hideUnityWindow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.view.window.rootViewController = vc;
}

-(void)hideUnityWindow{
    // 设置Unity状态为开启状态
    UnityPause(false);
    
    // 设置rootViewController为Unity的跟控制器
//    self.view.window.rootViewController = self.rootViewController;
    // 等同于
    
    
    
     self.view.window.rootViewController = UnityGetGLViewController();
    NSLog(@"设置rootView为Unity界面");
}
@end
