//
//  HomeListTableViewCell.h
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeListItem.h"

@interface HomeListTableViewCell : UITableViewCell

/** 数据模型 */
@property(nonatomic,strong) HomeListItem          *item;

+(HomeListTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end

