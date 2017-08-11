//
//  downloadView.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "downloadView.h"
#import "UIImageView+WebCache.h"
#import "singleToneClass.h"

@implementation downloadView
{
    UIView *headerView;
}
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        NSString *PicUrlString=[[singleToneClass sharedSingleTone]getLinkAddress];
        NSURL *url = [NSURL URLWithString:[PicUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        headerView=[[UIView alloc]init];
        headerView.frame=CGRectMake(0,20,SCREEN_WIDTH,50);
        headerView.backgroundColor=Rgb2UIColor(44,198,248);
        [self addSubview:headerView];
        
        UIButton *backButton=[[UIButton alloc]init];
        backButton.frame=CGRectMake(10,10,30,30);
        [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:backButton];
        
        UILabel *nextLabel=[[UILabel alloc]init];
        nextLabel.frame=CGRectMake(backButton.frame.origin.x+backButton.frame.size.width+20,10,SCREEN_WIDTH-(backButton.frame.size.width+30),30);
        nextLabel.font=[UIFont systemFontOfSize:18];
        //nextLabel.textAlignment=NSTextAlignmentCenter;
        nextLabel.textColor=WhiteColor;
        nextLabel.text=@"Download Image";
        [headerView addSubview:nextLabel];
        
       UIView *backgroundView=[[UIView alloc]init];
        backgroundView.frame=CGRectMake(0,headerView.frame.origin.y+headerView.frame.size.height,SCREEN_WIDTH,SCREEN_HEIGHT);
        backgroundView.backgroundColor=WhiteColor;
        [self addSubview:backgroundView];
        
        UIImageView *homeImageView=[[UIImageView alloc]init];
        homeImageView.frame=CGRectMake(10,40,backgroundView.frame.size.width-20,200);
        homeImageView.userInteractionEnabled=YES;
         [homeImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"next.png"] options:nil];
        homeImageView.backgroundColor=blackColor;
        [backgroundView addSubview:homeImageView];
        
        UIButton *downloadButton=[[UIButton alloc]init];
        [downloadButton setTitle:@"Download" forState:UIControlStateNormal];
        downloadButton.frame=CGRectMake(backgroundView.frame.size.width/3,homeImageView.frame.size.height+homeImageView.frame.origin.y+20,backgroundView.frame.size.width/3,40);
        [downloadButton addTarget:self action:@selector(downloadAction:) forControlEvents:UIControlEventTouchUpInside];
        downloadButton.layer.borderColor=blackColor.CGColor;
        downloadButton.layer.borderWidth=1;
        [downloadButton setTitleColor:blackColor forState:UIControlStateNormal];
        [backgroundView addSubview:downloadButton];

    }
    return self;
}
-(void)downloadAction:(UIButton *)sender{
    [_downloadDelegate DownloadImage];

}
-(void)backAction:(UIButton *)sender{
    [_downloadDelegate backToScreen];
}

@end
