//
//  TableViewCell.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
-(void)progessBar;
@property (nonatomic, strong) UIView *homeContainerView;
@property (nonatomic, strong) UIImageView *homeImageView;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UILabel *homeName;
@property (nonatomic, strong) UILabel *homeViewCount;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic,strong)  UIProgressView *progressView;
@end
