//
//  frontView.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "frontView.h"


@implementation frontView
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    UIView *backgroundView=[[UIView alloc]init];
    backgroundView.frame=CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    backgroundView.backgroundColor=Rgb2UIColor(44,198,248);
    [self addSubview:backgroundView];
    
    UILabel *nameLabel=[[UILabel alloc]init];
    nameLabel.frame=CGRectMake(20,SCREEN_HEIGHT/4,SCREEN_HEIGHT/2,60);
    nameLabel.font=[UIFont systemFontOfSize:14];
    nameLabel.numberOfLines=0;
    nameLabel.lineBreakMode=NSLineBreakByWordWrapping;
    nameLabel.textAlignment=NSTextAlignmentCenter;
    nameLabel.textColor=WhiteColor;
    nameLabel.text=@"Dreams and Dedication are a Powerful Combination!!";
    [backgroundView addSubview:nameLabel];
    
    UILabel *nextLabel=[[UILabel alloc]init];
    nextLabel.frame=CGRectMake(nameLabel.frame.origin.x+80,nameLabel.frame.size.height+nameLabel.frame.origin.y+50,SCREEN_HEIGHT/5,30);
    nextLabel.font=[UIFont systemFontOfSize:14];
    nextLabel.textAlignment=NSTextAlignmentCenter;
    nextLabel.textColor=WhiteColor;
    nextLabel.text=@"Next";
    [backgroundView addSubview:nextLabel];
    
    
    UIButton *loginButton=[[UIButton alloc]init];
    loginButton.layer.borderWidth=1;
    loginButton.frame=CGRectMake(SCREEN_WIDTH/4+50,nextLabel.frame.size.height+nextLabel.frame.origin.y+20,60,60);
    loginButton.layer.cornerRadius = loginButton.frame.size.height/2.0f;
    loginButton.layer.borderColor=blackColor.CGColor;
    [loginButton setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:loginButton];
    
}
-(void)nextAction:(UIButton *)sender{
    [_frontDelegate frontHomeScreen];
}


@end
