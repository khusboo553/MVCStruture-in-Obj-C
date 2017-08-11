//
//  singleToneClass.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "singleToneClass.h"
singleToneClass *sharedSingleTone;
@implementation singleToneClass
{
    NSString *linkA;
    NSDictionary *detailsDicthome;
     NSDictionary *detailsDictRebounds;
     NSDictionary *detailsDictTeams;
}

+ (singleToneClass *) sharedSingleTone {
    @synchronized(self){
        if(!sharedSingleTone){
            sharedSingleTone = [[singleToneClass alloc]init];
        }
    }return sharedSingleTone;
}

-(void)setLinkAddress:(NSString *)linkAddress{
    linkA=linkAddress;
}
-(NSString *)getLinkAddress{
    return linkA;
}
-(void)setDetailsDictionary:(NSDictionary *)DetailsDictionary{
    detailsDicthome=DetailsDictionary;
}
-(NSDictionary *)getDetailsDictionary{
    return detailsDicthome;
}
-(void)setDetailsDictionaryRebounds:(NSDictionary *)DetailsDictionaryRebounds{
    detailsDictRebounds=DetailsDictionaryRebounds;
}
-(NSDictionary *)getDetailsDictionaryRebounds{
    return detailsDictRebounds;
}
-(void)setDetailsDictionaryTeams:(NSDictionary *)DetailsDictionaryTeams{
    detailsDictTeams=DetailsDictionaryTeams;
}
-(NSDictionary *)getDetailsDictionaryTeams{
    return detailsDictTeams;
}

#pragma mark - convert json string to dictionary
- (id) convertJsonStringToObjectType:(NSString *)jsonString {
    
    NSError *error = nil;
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&error];
    return json;
}


@end
