//
//  homeViewController.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCustom.h"
#import "homeView.h"


@protocol homeControllerViewDelegate <NSObject>

//-(void)detailsData:(NSString *)linkString;
@end
@interface homeViewController : UIViewController
//@property(nonatomic,strong) id<homeControllerViewDelegate>homeControllerDelegate;
@end
