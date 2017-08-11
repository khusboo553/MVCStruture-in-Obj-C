//
//  httpHelperClass.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface httpHelperClass : NSObject
//- (NSString *) getDataFrom:(NSString *)url;
- (void) getRequest2WithUrl:(NSString *)url andCallback:(void(^)(id))callBack;
//- (void) getRequest2WithUrl:(NSString *)url andCallback:(void(^)(id))callBack;
@end
