//
//  HomeListTableViewCell.m
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "HomeListTableViewCell.h"

@implementation HomeListTableViewCell

+(HomeListTableViewCell *)cellWithTableView:(UITableView *)tableView
{
  static NSString *identifier = @"HomeListTableViewCell";
  HomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil)
  {
    cell = [[HomeListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self)
  {
    
  }
  return self;
}

- (void)setItem:(HomeListItem *)item
{
  self.textLabel.text = item.title;
  self.textLabel.textColor = item.titleColor;
  self.textLabel.font = item.titleFont;
  
  self.detailTextLabel.text = item.subTitle;
  self.detailTextLabel.textColor = item.subTitleColor;
  self.detailTextLabel.font = item.subTitleFont;
}

@end
