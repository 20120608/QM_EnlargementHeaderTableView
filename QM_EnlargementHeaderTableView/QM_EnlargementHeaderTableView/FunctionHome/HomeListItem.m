//
//  HomeListItem.m
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "HomeListItem.h"

@implementation HomeListItem


+(instancetype)initWithTitle:( NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor subTitle:(NSString *)subTitle subTitleFont:(UIFont *)subTitleFont subTitleColor:(UIColor *)subTitleColor destVC:(Class)destVC {
  
  HomeListItem *item = [[HomeListItem alloc] init];
  item.title = title;
  item.titleFont = titleFont;
  item.titleColor = titleColor;
  item.subTitle = subTitle;
  item.subTitleFont = subTitleFont;
  item.subTitleColor = subTitleColor;
  item.destVC = destVC;
  return item;
  
}

@end
