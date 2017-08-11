//
//  UITableViewCustom.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "UITableViewCustom.h"
#import "TableViewCell.h"
#import "frontHomeViewController.h"
#import "TableViewCell.h"
#import "MusicViewController.h"
#import "UIImageView+WebCache.h"
#import "singleToneClass.h"
#import "downloadViewController.h"
#import "downloadView.h"

@implementation UITableViewCustom
{
    NSString *rcvTableName;
    MusicViewController *musicView;
    NSArray*countArrayHome;
    NSString *hdImage;
}
-(id)initWithFrame:(CGRect)frame withTableViewName:(NSString *)tableName{
    self=[super initWithFrame:frame];
    if (self) {
        rcvTableName=tableName;
        musicView=[[MusicViewController alloc]init];
        self.delegate=self;
        self.dataSource=self;
        self.bounces=NO;
        self.layer.borderColor=Rgb2UIColor(44,198,248).CGColor;
        self.layer.borderWidth=1;
        self.scrollEnabled=YES;
        if ([rcvTableName isEqual:@"homeTabCellId"]){
           countArrayHome=[[[singleToneClass sharedSingleTone]getDetailsDictionary]objectForKey:@"usernameArray"];
        }else if ([rcvTableName isEqual:@"reboundsTabCellId"]){
            countArrayHome=[[[singleToneClass sharedSingleTone]getDetailsDictionaryRebounds]objectForKey:@"usernameArray"];
        }else if ([rcvTableName isEqual:@"teamsTabCellId"]){
             countArrayHome=[[[singleToneClass sharedSingleTone]getDetailsDictionaryTeams]objectForKey:@"usernameArray"];
        }
       
        [self reloadData];
}
    return self;
}
#pragma mark - tableview delegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![rcvTableName isEqualToString:@"musicTabCellId"]){
    return countArrayHome.count;
    }else{
        return 15;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![rcvTableName isEqualToString:@"musicTabCellId"]) {
        return 255;
    }else{
        return 70;
    }
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([rcvTableName isEqual:@"homeTabCellId"]) {
        TableViewCell *cell = [(UITableView *) tableView dequeueReusableCellWithIdentifier:@"homeTabCellId"];
        if (cell == nil) {
            cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeTabCellId"];
        }
        [cell.homeImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionary]objectForKey:@"ImageArrayTes"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"next.png"] options:nil];
        [cell.profileImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionary]objectForKey:@"profilePicArray"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"back.png"] options:nil];
        cell.homeName.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionary]objectForKey:@"usernameArray"]objectAtIndex:indexPath.row];
         cell.homeViewCount.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionary]objectForKey:@"viewCountArray"]objectAtIndex:indexPath.row];
        return cell;
    }else if ([rcvTableName isEqual:@"reboundsTabCellId"]){
        TableViewCell *cell = [(UITableView *) tableView dequeueReusableCellWithIdentifier:@"reboundsTabCellId"];
            if (cell == nil) {
                cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reboundsTabCellId"];
            }
        [cell.homeImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionaryRebounds]objectForKey:@"ImageArrayTes"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"next.png"] options:nil];
        [cell.profileImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionaryRebounds]objectForKey:@"profilePicArray"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"back.png"] options:nil];
        cell.homeName.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionaryRebounds]objectForKey:@"usernameArray"]objectAtIndex:indexPath.row];
        cell.homeViewCount.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionaryRebounds]objectForKey:@"viewCountArray"]objectAtIndex:indexPath.row];
        return cell;

    }else if ([rcvTableName isEqualToString:@"musicTabCellId"]){
        TableViewCell *cell = [(UITableView *) tableView dequeueReusableCellWithIdentifier:@"musicTabCellId"];
        if (cell == nil) {
            cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"musicTabCellId"];
        }
       // NSString *cellRef=cell;
        
        cell.stopButton.tag=indexPath.row;
        cell.startButton.tag=indexPath.row;
        [cell.stopButton addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];

        return cell;
    }
    else{
            TableViewCell *cell = [(UITableView *) tableView dequeueReusableCellWithIdentifier:@"teamsTabCellId"];
            if (cell == nil) {
                cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"teamsTabCellId"];
        }
        [cell.homeImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionaryTeams]objectForKey:@"ImageArrayTes"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"next.png"] options:nil];
        [cell.profileImageView sd_setImageWithURL:[[[[singleToneClass sharedSingleTone] getDetailsDictionaryTeams]objectForKey:@"profilePicArray"]objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"back.png"] options:nil];
        cell.homeName.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionaryTeams]objectForKey:@"usernameArray"]objectAtIndex:indexPath.row];
        cell.homeViewCount.text=[[[[singleToneClass sharedSingleTone]getDetailsDictionaryTeams]objectForKey:@"viewCountArray"]objectAtIndex:indexPath.row];
    return cell;
    }
    return nil;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([rcvTableName isEqual:@"homeTabCellId"]){
        hdImage=  [[[[singleToneClass sharedSingleTone]getDetailsDictionary]objectForKey:@"ImageArrayHD"] objectAtIndex:indexPath.row];
      
        [[NSNotificationCenter defaultCenter]postNotificationName:@"HomeTable" object:hdImage userInfo:nil];
       
        
    }else if ([rcvTableName isEqual:@"reboundsTabCellId"]){
         hdImage=  [[[[singleToneClass sharedSingleTone]getDetailsDictionaryRebounds]objectForKey:@"ImageArrayHD"] objectAtIndex:indexPath.row];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ReboundsTable" object:hdImage userInfo:nil];

    }else if([rcvTableName isEqual:@"teamsTabCellId"]){
         hdImage=  [[[[singleToneClass sharedSingleTone]getDetailsDictionaryTeams]objectForKey:@"ImageArrayHD"] objectAtIndex:indexPath.row];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"TeamTable" object:hdImage userInfo:nil];
    }
        [[singleToneClass sharedSingleTone]setLinkAddress:hdImage];
}

-(void)startAction:(UIButton *)sender{
    NSString *sendData=[NSString stringWithFormat:@"%ld", sender.tag];
    [musicView startMusicActionWithSender:sendData];
}

-(void)stopAction:(UIButton *)sender{
    NSString *sendData=[NSString stringWithFormat:@"%ld", sender.tag];
    [musicView stopMusicActionWithSender:sendData];
}
@end
