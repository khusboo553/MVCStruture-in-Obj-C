//
//  DownloadManager.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 12/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadManager : NSObject<NSURLSessionDownloadDelegate,UIImagePickerControllerDelegate>
+ (DownloadManager *) sharedDownload;
-(void)startDownloadWith:(NSDictionary *)dataDict;
@property (nonatomic, strong)NSURLSessionDownloadTask *download;
@property (nonatomic, strong)NSURLSession *backgroundSession;
@end
