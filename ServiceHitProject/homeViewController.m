//
//  homeViewController.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "homeViewController.h"

#import "frontHomeViewController.h"
#import "MusicViewController.h"
#import "downloadViewController.h"

@interface homeViewController ()<homeViewDelegate>{
    homeView *homeUIView;
    BOOL controllerValue;
}

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    controllerValue=NO;
    [self createUI];
}

-(void)createUI{
    homeUIView=[[homeView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:homeUIView];
   
 }
-(void)detailsData:(NSNotification*)sender{
        downloadViewController *dControl=[[downloadViewController alloc]init];
        dControl.photoString=sender.object;
        [self.navigationController pushViewController:dControl animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    homeUIView.homeDelegate=self;
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(detailsData:) name:@"TeamTable" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(detailsData:) name:@"HomeTable" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(detailsData:) name:@"ReboundsTable" object:nil];

}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"TeamTable" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"HomeTable" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ReboundsTable" object:nil];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(void)backToFrontScreen{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
