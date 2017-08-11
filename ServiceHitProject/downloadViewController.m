//
//  downloadViewController.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "downloadViewController.h"
#import "downloadView.h"
#import "homeViewController.h"
#import "singleToneClass.h"
#import "UITableViewCustom.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#import "DownloadManager.h"

downloadViewController *sharedDownloadV;
@interface downloadViewController ()<downloadViewDelegate>

@end

@implementation downloadViewController

+ (downloadViewController *) sharedDownloadController {
    @synchronized(self){
        if(!sharedDownloadV){
            sharedDownloadV = [[downloadViewController alloc]init];
        }
    }return sharedDownloadV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
   
}

-(void)createUI{
    downloadView *dView=[[downloadView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    dView.downloadDelegate=self;
    [self.view addSubview:dView];
  
}
-(void)DownloadImage{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set some text to show the initial status.
    hud.label.text = NSLocalizedString(@"Preparing...", @"HUD preparing title");
    // Will look best, if we set a minimum size.
    hud.minSize = CGSizeMake(150.f, 100.f);
    NSString *urlString=[[singleToneClass sharedSingleTone]getLinkAddress];
    NSMutableDictionary *dataDict=[[NSMutableDictionary alloc]init];
    [dataDict setObject:urlString forKey:@"urlString"];
    [dataDict setObject:@"photo.png" forKey:@"senderString"];
    
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [[DownloadManager sharedDownload]startDownloadWith:dataDict];
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithMixedProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}
- (void)doSomeWorkWithMixedProgress {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.navigationController.view];
    // Indeterminate mode
    sleep(2);
    // Switch to determinate mode
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeDeterminate;
        hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    });
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
        usleep(50000);
    }
    // Back to indeterminate mode
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = NSLocalizedString(@"Cleaning up...", @"HUD cleanining up title");
    });
    sleep(2);
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.label.text = NSLocalizedString(@"Completed", @"HUD completed title");
    });
    sleep(2);
}

-(void)backToScreen{
   [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
