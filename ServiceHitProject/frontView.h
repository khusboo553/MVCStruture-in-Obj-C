//
//  frontView.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 06/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol frontViewDelegate <NSObject>

-(void)frontHomeScreen;

@end

@interface frontView : UIView
@property(nonatomic,weak)id<frontViewDelegate>frontDelegate;
-(id)initWithFrame:(CGRect)frame;
@end
