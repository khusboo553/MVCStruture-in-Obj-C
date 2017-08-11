//
//  downloadViewController.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol downloadControllerViewDelegate <NSObject>


@end

@interface downloadViewController : UIViewController
-(void)createUI;
+ (downloadViewController *) sharedDownloadController;

@property(nonatomic,strong) id<downloadControllerViewDelegate>downloadControllerDelegate;
@property(nonatomic,strong)NSString *photoString;
@end
