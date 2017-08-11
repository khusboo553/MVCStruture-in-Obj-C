//
//  TableViewCell.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "TableViewCell.h"
//TableViewCell *sharedTableViewCell;
@implementation TableViewCell
//+ (TableViewCell *) sharedTableViewCell {
//    @synchronized(self){
//        if(!sharedTableViewCell){
//            sharedTableViewCell = [[TableViewCell alloc]init];
//        }
//    }
//    return sharedTableViewCell;
//}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        if ( [reuseIdentifier isEqualToString:@"homeTabCellId"]||[reuseIdentifier isEqualToString:@"reboundsTabCellId"]||[reuseIdentifier isEqualToString:@"teamsTabCellId"]) {
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            _homeContainerView = [[UIView alloc]init];
            _homeContainerView.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20, SCREEN_HEIGHT/3+50);
            _homeContainerView.backgroundColor =Rgb2UIColor(44,198,248);
            [self.contentView addSubview:_homeContainerView];
            
            _homeImageView=[[UIImageView alloc]init];
            _homeImageView.frame=CGRectMake(10,10,_homeContainerView.frame.size.width-20,_homeContainerView.frame.size.height-60);
            _homeImageView.userInteractionEnabled=YES;
            _homeImageView.backgroundColor=WhiteColor;
            [_homeContainerView addSubview:_homeImageView];
            
            _profileImageView=[[UIImageView alloc]init];
           // _profileImageView.frame=CGRectMake(0,0,60,60);
            _profileImageView.frame=CGRectMake(0,_homeImageView.frame.size.height+_homeImageView.frame.origin.y,50,50);
            _profileImageView.layer.cornerRadius =_profileImageView.frame.size.height /2.0f;
            _profileImageView.layer.borderColor=blackColor.CGColor;
            self.profileImageView.clipsToBounds = YES;
            _profileImageView.layer.borderWidth=1;
            _profileImageView.backgroundColor=WhiteColor;
            [_homeContainerView addSubview:_profileImageView];
            
            _homeName=[[UILabel alloc]init];
            _homeName.frame=CGRectMake(_profileImageView.frame.size.width+_profileImageView.frame.origin.x+10,_homeImageView.frame.size.height+_homeImageView.frame.origin.y+10,_homeImageView.frame.size.width/3,20);
            _homeName.font=[UIFont systemFontOfSize:13];
            _homeName.textAlignment=NSTextAlignmentLeft;
            _homeName.textColor=WhiteColor;
            _homeName.text=@"username";
            [_homeContainerView addSubview:_homeName];
            
            _homeViewCount=[[UILabel alloc]init];
            _homeViewCount.frame=CGRectMake(_homeName.frame.origin.x+_homeName.frame.size.width,_homeImageView.frame.size.height+_homeImageView.frame.origin.y+10,_homeImageView.frame.size.width/3,20);
            _homeViewCount.font=[UIFont systemFontOfSize:13];
            _homeViewCount.textAlignment=NSTextAlignmentRight;
            _homeViewCount.textColor=WhiteColor;
            _homeViewCount.text=@"ViewCount";
            [_homeContainerView addSubview:_homeViewCount];
        }
        if ([reuseIdentifier isEqualToString:@"musicTabCellId"])
        {
            _homeContainerView = [[UIView alloc]init];
            _homeContainerView.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20,50);
            _homeContainerView.backgroundColor =Rgb2UIColor(44,198,248);
            [self.contentView addSubview:_homeContainerView];
            
            _profileImageView=[[UIImageView alloc]init];
            _profileImageView.frame=CGRectMake(0,5,40,40);
            _profileImageView.layer.cornerRadius =_profileImageView.frame.size.height /2.0f;
            _profileImageView.layer.borderColor=blackColor.CGColor;
            _profileImageView.layer.borderWidth=1;
            _profileImageView.backgroundColor=WhiteColor;
            [_homeContainerView addSubview:_profileImageView];
            
            _homeName=[[UILabel alloc]init];
            _homeName.frame=CGRectMake(_profileImageView.frame.size.width+_profileImageView.frame.origin.x+10,10,_homeContainerView.frame.size.width/2,20);
            _homeName.font=[UIFont systemFontOfSize:13];
            _homeName.textAlignment=NSTextAlignmentLeft;
            _homeName.textColor=WhiteColor;
            _homeName.text=@"Music Name:";
            [_homeContainerView addSubview:_homeName];

           
            _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
            _progressView.frame = CGRectMake(_profileImageView.frame.size.width+_profileImageView.frame.origin.x+10,_homeName.frame.size.height+_homeName.frame.origin.y+10,130, 15);
            _progressView.bounds = CGRectMake(_profileImageView.frame.size.width+_profileImageView.frame.origin.x+10,_homeName.frame.size.height+_homeName.frame.origin.y+10,130, 15);
            _progressView.backgroundColor = blackColor;
            [_progressView setUserInteractionEnabled:NO];
            [_progressView setTrackTintColor:[UIColor blueColor]];
            [_progressView setProgressTintColor:[UIColor redColor]];
            [_homeContainerView addSubview:_progressView];

//            progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//            progressView.progressTintColor = [UIColor colorWithRed:187.0/255 green:160.0/255 blue:209.0/255 alpha:1.0];
//            [[progressView layer]setFrame:CGRectMake(20, 50,50,20)];
//            [[progressView layer]setBorderColor:[UIColor redColor].CGColor];
//            progressView.trackTintColor = [UIColor blueColor];
//            [progressView setProgress:(float)(50/100) animated:YES];  ///15
//            //[[progressView layer]setCornerRadius:progressView.frame.size.width / 2];
//            [[progressView layer]setBorderWidth:3];
//            [[progressView layer]setMasksToBounds:TRUE];
//            progressView.clipsToBounds = YES;
//            [_homeContainerView addSubview:progressView];
            
            _startButton=[[UIButton alloc]init];
            _startButton.layer.borderWidth=1;
            _startButton.layer.borderColor=blackColor.CGColor;
            _startButton.frame=CGRectMake(_homeName.frame.size.width+_homeName.frame.origin.x,5,50,20);
            _startButton.titleLabel.font=[UIFont systemFontOfSize:11];
            [_startButton setTitle:@"Start" forState:UIControlStateNormal];
            [_homeContainerView addSubview:_startButton];
            
            _stopButton=[[UIButton alloc]init];
            _stopButton.layer.borderWidth=1;
            _stopButton.layer.borderColor=blackColor.CGColor;
            _stopButton.frame=CGRectMake(_homeName.frame.size.width+_homeName.frame.origin.x,_startButton.frame.size.height+_startButton.frame.origin.y+5,50,20);
            [_stopButton setTitle:@"Stop" forState:UIControlStateNormal];
             _stopButton.titleLabel.font=[UIFont systemFontOfSize:11];
            [_homeContainerView addSubview:_stopButton];
        }
       
    }
    return self;
}
-(void)progessBar{
    _progressView.hidden=NO;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
