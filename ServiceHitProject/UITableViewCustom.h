//
//  UITableViewCustom.h
//  ServiceHitProject
//
//  Created by GLB-285-PC on 07/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "downloadViewController.h"
@protocol tableViewDelegate <NSObject>
-(void)startActionwith:(NSString *)sender;
-(void)detailsData:(NSString *)linkString;

@end


@interface UITableViewCustom : UITableView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) NSString *tableString;
@property(nonatomic,weak)id<tableViewDelegate>tableDelegate;
//- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ;
-(id)initWithFrame:(CGRect)frame withTableViewName:(NSString *)tableName;
@end
