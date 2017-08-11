//
//  teamsViewController.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCustom.h"

@interface teamsViewController : UIViewController
@property(nonatomic,strong) UIScrollView *backgroundView;
@property(nonatomic,strong)     UITableViewCustom *tableViewCustom;

-(void)details;
@end
