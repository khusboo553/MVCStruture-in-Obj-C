//
//  homeView.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "homeView.h"


@implementation homeView
{
    HMSegmentedControl *segmentControl;
    UIScrollView *settingsBackgroundScrollView;
    UIView *backgroundView;
    UIView *headerView;
//    UITableView *homeTableView;
//     UITableView *reboundsTableView;
//     UITableView *teamsTableView;
//    UITableView *tableView;
}
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        
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
        nextLabel.text=@"HOME";
        [headerView addSubview:nextLabel];
        
        [self fetchDetails];
    }
    return self;
}
-(void)fetchDetails{
    [self createUI];
}

-(void)createUI{
   
    backgroundView=[[UIView alloc]init];
    backgroundView.frame=CGRectMake(0,headerView.frame.origin.y+headerView.frame.size.height,SCREEN_WIDTH,SCREEN_HEIGHT);
    backgroundView.backgroundColor=WhiteColor;
    [self addSubview:backgroundView];
    
    segmentControl = [[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH,30)];
    segmentControl.sectionTitles = @[@"Home",@"Rebounds",@"Teams",@"Music"];
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.backgroundColor = WhiteColor;
    segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName :blackColor };
    segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName :Rgb2UIColor(44,198,248)};
    segmentControl.selectionIndicatorColor =Rgb2UIColor(44,198,248);
    segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    [backgroundView addSubview:segmentControl];
    [segmentControl setIndexChangeBlock:^(NSInteger index) {
        
    [settingsBackgroundScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    settingsBackgroundScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,segmentControl.frame.origin.y+segmentControl.frame.size.height+10, SCREEN_WIDTH, backgroundView.frame.size.height - (segmentControl.frame.origin.y + segmentControl.frame.size.height))];
    settingsBackgroundScrollView.delegate = self;
    settingsBackgroundScrollView.pagingEnabled = YES;
    settingsBackgroundScrollView.backgroundColor = [UIColor greenColor];

    settingsBackgroundScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, settingsBackgroundScrollView.frame.size.height);
    settingsBackgroundScrollView.bounces = NO;
    CGPoint scrollPoint = CGPointMake(SCREEN_WIDTH * 0, 0);
    [settingsBackgroundScrollView setContentOffset:scrollPoint animated:YES];
    [backgroundView addSubview:settingsBackgroundScrollView];
    
    [self dataControllers];
}
-(void)dataControllers{
    
    for (int i = 0; i < 4; i++) {
            CGFloat originOfEachPage = i * SCREEN_WIDTH;
    
          UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(originOfEachPage,0, SCREEN_WIDTH, settingsBackgroundScrollView.frame.size.height)];
            pageView.backgroundColor = RedColor;
          [settingsBackgroundScrollView addSubview:pageView];
        
        if (i==0) {
            frontHomeViewController *homeView=[[frontHomeViewController alloc]init];
            [homeView details];
            [pageView addSubview: homeView.backgroundView];
           
        }else if (i==1){
            reboundsViewController *reboundView=[[reboundsViewController alloc]init];
            [reboundView details];
            [pageView addSubview:reboundView.backgroundView];
            
        }else if (i==2){
           self.teamViewController=[[teamsViewController alloc]init];
            [self.teamViewController details];
            [pageView addSubview: self.teamViewController.backgroundView];
        }
        else{
           // [self musicTab];
            MusicViewController *musicView=[[MusicViewController alloc]init];
            [musicView details];
            [pageView addSubview:musicView.backgroundView];
        }
    }
    
}
//-(void)musicTab{
//      [_homeDelegate musicTab];
//}
//-(void)homeTab{
//     [_homeDelegate homeTab];
//}
#pragma mark : scrolling view delegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [segmentControl setSelectedSegmentIndex:page animated:YES];
}
- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [segmentControl setSelectedSegmentIndex:page animated:YES];
}


-(void)backAction:(UIButton *)sender{
    [_homeDelegate backToFrontScreen];
}
@end
