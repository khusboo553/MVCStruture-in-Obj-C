//
//  DownloadManager.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 12/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager
DownloadManager *sharedDownload;
NSString *senderString;
+ (DownloadManager *) sharedDownload {
    
    @synchronized(self){
        if(!sharedDownload){
            sharedDownload = [[DownloadManager alloc]init];
        }
    }return sharedDownload;
}
-(void)startDownloadWith:(NSDictionary *)dataDict{
    NSURLSessionConfiguration *backgroundConfigurationObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"myBackgroundSessionIdentifier"];
    self.backgroundSession =  [NSURLSession sessionWithConfiguration:backgroundConfigurationObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSString *urlString=[dataDict objectForKey:@"urlString"];
    senderString=[dataDict objectForKey:@"senderString"];
    if (nil == _download){
    NSURL *url = [NSURL URLWithString:urlString];
    _download = [self.backgroundSession downloadTaskWithURL:url];
    [_download resume];
  }
    
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    
    float percentDone = (double)totalBytesWritten/(double)totalBytesExpectedToWrite;
   NSLog(@"%f",percentDone);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableDictionary *data=[[NSMutableDictionary alloc]init];
        [data setObject:[NSNumber numberWithFloat:percentDone] forKey:@"percent"];
        [data setObject:downloadTask forKey:@"downloadTask"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"UpdateProgressBar" object:data];
    });
    
    //[tableView.progressView setProgress:(double)totalBytesWritten/(double)totalBytesExpectedToWrite
                               //animated:YES];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSData *mediaData = [NSData dataWithContentsOfURL:location];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString*documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"paths----%@",paths);
    NSString *mediaName=senderString;
    NSString*mediaExtention=@"MOV";
    NSString* filePath = [NSString stringWithFormat:@"%@/%@.%@", documentsDirectory,mediaName,mediaExtention];
    [mediaData writeToFile:filePath atomically:YES];
    
    UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:mediaData], nil, nil, nil);

//            [fileManager replaceItemAtURL:destinationURL withItemAtURL:destinationURL backupItemName:nil options:NSFileManagerItemReplacementUsingNewMetadataOnly resultingItemURL:nil error:&error];
    //        [self showFile:[destinationURL path]];
////    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
////    NSString *documentDirectoryPath = [paths objectAtIndex:0];
////    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    //NSURL *destinationURL = [NSURL fileURLWithPath:[documentDirectoryPath stringByAppendingPathComponent:@"file.mp4"]];
//    
//    NSURL *destinationURL = [NSURL fileURLWithPath:[documentDirectoryPath stringByAppendingPathComponent:senderString]];
//    NSError *error = nil;
//    
//    if ([fileManager fileExistsAtPath:[destinationURL path]]){
//        [fileManager replaceItemAtURL:destinationURL withItemAtURL:destinationURL backupItemName:nil options:NSFileManagerItemReplacementUsingNewMetadataOnly resultingItemURL:nil error:&error];
////        [self showFile:[destinationURL path]];
//        
//    }else{
//        
//        if ([fileManager moveItemAtURL:location toURL:destinationURL error:&error]) {
//            
////            [self showFile:[destinationURL path]];
//        }else{
//            NSLog(@"++++++failed+++++++");
////            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"PDFDownloader" message:[NSString stringWithFormat:@"An error has occurred when moving the file: %@",[error localizedDescription]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
////            [alert show];
//        }
//    }
}

//- (void)showFile:(NSString*)path{
//    
//    // Check if the file exists
//    BOOL isFound = [[NSFileManager defaultManager] fileExistsAtPath:path];
//    if (isFound) {
//        
//        UIDocumentInteractionController *viewer = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:path]];
//        viewer.delegate =self;
//        [viewer presentPreviewAnimated:YES];
//    }
//}

//- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller{
//    
//    return self;
//}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    
    _download = nil;
  // [tableView.progressView setProgress:0];
    
    if (error) {
           NSLog(@"++++++failed+++++++");
    }else{
        
         NSLog(@"++++++Downloaded+++++++");    }
}




@end
