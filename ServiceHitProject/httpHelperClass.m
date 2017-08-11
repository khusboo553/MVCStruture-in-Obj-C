//
//  httpHelperClass.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "httpHelperClass.h"

@implementation httpHelperClass

- (void) getRequest2WithUrl:(NSString *)url andCallback:(void(^)(id))callBack{
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
    
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"Request reply: %@", requestReply);
            id jsonResponse =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
//            NSError *e = nil;
//            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
//            
//            if (!jsonArray) {
//                NSLog(@"Error parsing JSON: %@", e);
//            } else {
//                for(NSDictionary *item in jsonArray) {
//                    NSLog(@"Item: %@", item);
//                }
//            }
            

                      callBack (jsonResponse);
        }]
         resume];
    
}

@end
