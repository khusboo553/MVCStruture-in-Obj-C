//
//  APIhelperClass.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "APIhelperClass.h"
#import "httpHelperClass.h"

@implementation APIhelperClass
{
    httpHelperClass *helperGet;
}

#pragma mark - GethomeServices
-(void)getHomeService:(NSString *)data andCallback:(void(^)(id))callBack
{
     helperGet=[[httpHelperClass alloc]init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",serverVariable,data]];
     NSString *urlString = url.absoluteString;
    [helperGet getRequest2WithUrl :urlString andCallback:^(id postRequestResponse)
     {
         callBack(postRequestResponse);
     }];
}
//-(void)getMusicService:(NSDictionary *)dataDict andCallback:(void(^)(id))callBack
//{
//    helperGet=[[httpHelperClass alloc]init];
//    NSString *dataUrl=[dataDict objectForKey:@"urlString"];
//     NSString *dataName=[dataDict objectForKey:@"senderString"];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",dataUrl]];
//    NSString *urlString = url.absoluteString;
//    [helperGet getRequest2WithUrl :urlString andCallback:^(id postRequestResponse)
//     {
//         callBack(postRequestResponse);
//     }];
//}

@end
