//
//  MusicViewController.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 11/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface MusicViewController : UIViewController<NSURLSessionDownloadDelegate, UIDocumentInteractionControllerDelegate>
@property(nonatomic,strong) UIView *backgroundView;
-(void)details;
-(void)startMusicActionWithSender:(NSString *)sender;
-(void)stopMusicActionWithSender:(NSString *)sender;


@property (nonatomic, strong) TableViewCell *tableView;
@end
