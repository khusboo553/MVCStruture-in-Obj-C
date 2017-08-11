//
//  homeView.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "frontHomeViewController.h"
#import "UITableViewCustom.h"
#import "teamsViewController.h"
#import "reboundsViewController.h"
#import "MusicViewController.h"
#import "homeViewController.h"

@class HomeView;
@protocol homeViewDelegate <NSObject>
-(void)HomeScreen;
-(void)backToFrontScreen;
-(void)homeTab;
-(void)musicTab;
@end

@interface homeView : UIView<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

//property
@property(nonatomic,strong)id<homeViewDelegate>homeDelegate;
@property(nonatomic,strong)reboundsViewController *reboundViewController;
@property(nonatomic,strong)teamsViewController *teamViewController;
@property(nonatomic,strong)frontHomeViewController *frontHomeViewController;




-(id)initWithFrame:(CGRect)frame;
@end
