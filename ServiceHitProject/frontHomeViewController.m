//
//  frontHomeViewController.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "frontHomeViewController.h"
#import "UITableViewCustom.h"
#import "MusicViewController.h"
#import "TableViewCell.h"
#import "singleToneClass.h"
#import "APIhelperClass.h"
#import "downloadViewController.h"

@interface frontHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
 @end

@implementation frontHomeViewController
{
    UITableViewCustom *tableViewCustom;
    TableViewCell *tableView;
    MusicViewController *musicV;
    NSMutableArray *ImageArrayTes;
    NSMutableArray *ImageArrayHD;
    NSMutableArray *viewCountArray;
    NSMutableArray *usernameArray;
     NSMutableArray *userPicArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImageArrayTes=[[NSMutableArray alloc]init];
    ImageArrayHD=[[NSMutableArray alloc]init];
    userPicArray=[[NSMutableArray alloc]init];
    usernameArray=[[NSMutableArray alloc]init];
     viewCountArray=[[NSMutableArray alloc]init];
    // 1
//   musicV=[[MusicViewController alloc]init];
//    tableView=[[TableViewCell alloc]init];
//    NSURLSessionConfiguration *backgroundConfigurationObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"myBackgroundSessionIdentifier"];
//    
//    // 2
//    musicV.backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfigurationObject delegate:musicV.self delegateQueue:[NSOperationQueue mainQueue]];
//    
//    // 3
//    [tableView.progressView setProgress:0 animated:NO];
}
-(void)details{
    _backgroundView =[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT-100)];
    _backgroundView.backgroundColor=WhiteColor;
     [self.view addSubview:_backgroundView];
    
      [self serviceHit];
    
    
}
-(void)serviceHit{
    NSString *linkAddr=@"sort=&access_token=a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21";
    [[singleToneClass sharedSingleTone]setLinkAddress:linkAddr];
    APIhelperClass *helperApi = [[APIhelperClass alloc]init];
    [helperApi getHomeService:linkAddr andCallback:^(id jsonResponse){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",jsonResponse);
            NSError *error;
            if (jsonResponse!=nil) {
                NSString* value = (NSString*)jsonResponse;
                 NSArray *jsonDataArray=[NSJSONSerialization JSONObjectWithData:[value dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
                
                for (int i=0; i<jsonDataArray.count;i++) {
                   
                    NSString *imageStringTes=[[[jsonDataArray objectAtIndex:i]objectForKey:@"images"]objectForKey:@"teaser"];
                     NSString *imageStringHD=[[[jsonDataArray objectAtIndex:i]objectForKey:@"images"]objectForKey:@"hidpi"];
                    [ImageArrayTes addObject:imageStringTes];
                    [ImageArrayHD addObject:imageStringHD];
                    
                   NSString *viewCountLong=[[jsonDataArray objectAtIndex:i]objectForKey:@"views_count"];
                    [viewCountArray addObject:[NSString stringWithFormat:@"%@",viewCountLong]];
                    NSString *userName=[[[jsonDataArray objectAtIndex:i]objectForKey:@"user"]objectForKey:@"username"];
                    NSString *userProfilePic=[[[jsonDataArray objectAtIndex:i]objectForKey:@"user"]objectForKey:@"avatar_url"];
                    [usernameArray addObject:userName];
                    [userPicArray addObject:userProfilePic];
                }
                NSMutableDictionary *details=[[NSMutableDictionary alloc]init];
                [details setObject:userPicArray forKey:@"profilePicArray"];
                [details setObject:usernameArray forKey:@"usernameArray"];
                 [details setObject:viewCountArray forKey:@"viewCountArray"];
                 [details setObject:ImageArrayTes forKey:@"ImageArrayTes"];
                 [details setObject:ImageArrayHD forKey:@"ImageArrayHD"];
                [[singleToneClass sharedSingleTone] setDetailsDictionary:details];
                tableViewCustom=[[UITableViewCustom alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,_backgroundView.frame.size.height-10) withTableViewName:@"homeTabCellId"];
                [_backgroundView addSubview:tableViewCustom];
            }
        });
    }];
}
-(void)homeUI{
    downloadViewController *downloadV=[[downloadViewController alloc]init];
    [self.navigationController pushViewController:downloadV animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
