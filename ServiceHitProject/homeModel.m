//
//  homeModel.m
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "homeModel.h"
homeModel *sharedHomeModel;
@implementation homeModel

+ (homeModel *) sharedHomeModel {
    @synchronized(self){
     if(!sharedHomeModel){
            sharedHomeModel = [[homeModel alloc]init];
        }
    }return sharedHomeModel;
}




@end
