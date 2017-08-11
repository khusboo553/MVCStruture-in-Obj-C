//
//  MusicViewController.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 11/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "MusicViewController.h"
#import "UITableViewCustom.h"
#import "APIhelperClass.h"
#import "TableViewCell.h"
#import "DownloadManager.h"

@interface MusicViewController ()<UITableViewDelegate,UITableViewDataSource>
{

}
@end

@implementation MusicViewController
{
    UITableViewCustom *tableViewCustom;
    NSArray *musicArray;
    //TableViewCell *tableView;
    NSString *senderString;
    NSString *urlString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
  //  [self details];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
      [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateProgressBar:) name:@"UpdateProgressBar" object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
   
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"UpdateProgressBar" object:nil];
}
- (void) updateProgressBar:(NSNotification *)sender {
    NSDictionary *data=[sender.object mutableCopy];
    NSURLSessionDownloadTask *downloadTask=[data objectForKey:@"downloadTask"];
    NSNumber *percentDone=[data objectForKey:@"percent"];
    NSURL *active=downloadTask.currentRequest.URL;
    if([[NSString stringWithFormat:@"%@",active] isEqualToString:[NSString stringWithFormat:@"%@",urlString]]){
        [self.tableView progessBar];
        CGFloat percent=[percentDone floatValue];
        [self.tableView.progressView setProgress:percent];
    }
}
-(void)details{
   
    _backgroundView =[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT-100)];
    _backgroundView.backgroundColor=WhiteColor;
    [self.view addSubview:_backgroundView];
    
    
    tableViewCustom=[[UITableViewCustom alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,_backgroundView.frame.size.height-10) withTableViewName:@"musicTabCellId"];
    [_backgroundView addSubview:tableViewCustom];
    
//      self.tableView=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"musicTabCellId"];
//    [tableViewCustom addSubview:self.tableView];
}
-(void)startMusicActionWithSender:(NSString *)sender{
   
 musicArray=[NSArray arrayWithObjects:@"http://cdn.online-convert.com/example-file/audio/m4a/example.m4a",@"http://www.sample-videos.com/audio/mp3/india-national-anthem.mp3",
                nil];
   
    int value = [sender intValue];
    urlString=[musicArray objectAtIndex:value];
     senderString = [NSString stringWithFormat:@"%@.mp4", sender];
   
    [_tableView progessBar];
    
    NSMutableDictionary *dataDict=[[NSMutableDictionary alloc]init];
    [dataDict setObject:urlString forKey:@"urlString"];
    [dataDict setObject:senderString forKey:@"senderString"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[DownloadManager sharedDownload]startDownloadWith:dataDict];
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });


}

-(void)stopMusicActionWithSender:(NSString *)sender{
//    if (nil != _download){
//        [_download cancel];
//    }
}
@end
