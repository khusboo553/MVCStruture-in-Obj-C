//
//  singleToneClass.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleToneClass : NSObject
+ (singleToneClass *) sharedSingleTone;

@property (nonatomic, assign, getter=getLinkAddress) NSString *linkAddress;
@property (nonatomic, assign, getter=getDetailsDictionary) NSDictionary *DetailsDictionary;
@property (nonatomic, assign, getter=getDetailsDictionaryRebounds) NSDictionary *DetailsDictionaryRebounds;
@property (nonatomic, assign, getter=getDetailsDictionaryTeams) NSDictionary *DetailsDictionaryTeams;
- (id) convertJsonStringToObjectType:(NSString *)jsonString;
@end
