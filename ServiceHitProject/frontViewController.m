//
//  frontViewController.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "frontViewController.h"
#import "frontView.h"
#import "homeViewController.h"
#import "MusicViewController.h"

@interface frontViewController ()<frontViewDelegate>

@end

@implementation frontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1
//    MusicViewController *mView=[[MusicViewController alloc]init];
//    NSURLSessionConfiguration *backgroundConfigurationObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"myBackgroundSessionIdentifier"];
    
    // 2
    //mView.backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfigurationObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 3
   //[self.progressView setProgress:0 animated:NO];
    [self createUI];
    
}
-(void)createUI{
    frontView *fView=[[frontView alloc]initWithFrame:CGRectMake(0,20,SCREEN_WIDTH,SCREEN_HEIGHT)];
    fView.frontDelegate=self;
    [self.view addSubview:fView];
    
}
-(void)frontHomeScreen{
    homeViewController *home=[[homeViewController alloc]init];
//    [self presentViewController:home animated:YES completion:nil];
    UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController * rootNavigation = [[UINavigationController alloc]initWithRootViewController:home];
    rootNavigation.navigationBarHidden=YES;
    [top presentViewController:rootNavigation animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
