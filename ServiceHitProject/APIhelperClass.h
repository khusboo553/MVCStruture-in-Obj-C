//
//  APIhelperClass.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIhelperClass : NSObject
//- (void) getHomeService:(NSDictionary *)dataDict andCallback:(void (^)(id))callBack;
-(void)getHomeService:(NSString *)data andCallback:(void(^)(id))callBack;
-(void)getMusicService:(NSDictionary *)dataDict andCallback:(void(^)(id))callBack;
@end
