//
//  frontHomeViewController.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol homeScreenViewDelegate <NSObject>

@end
@interface frontHomeViewController : UIViewController
@property(nonatomic,strong) UIView *backgroundView;

-(void)details;
-(void)homeUI;
@end
