//
//  downloadView.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeView;
@protocol downloadViewDelegate <NSObject>
-(void)DownloadImage;
-(void)backToScreen;
@end

@interface downloadView : UIView
@property(nonatomic,strong)id<downloadViewDelegate>downloadDelegate;
-(id)initWithFrame:(CGRect)frame;
@end
