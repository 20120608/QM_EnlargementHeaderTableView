//
//  HomeViewController.m
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeListItem.h"
#import "HomeListTableViewCell.h"
#import "EnlargementHeaderTableViewController.h"

@interface HomeViewController ()
{
  NSMutableArray          *_homeListItemArray;/** 列表内容数组 */
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //约束列表内边距
  UIEdgeInsets edgeInsets = self.tableView.contentInset;
  edgeInsets.bottom += TAB_BAR_HEIGHT;
  self.tableView.contentInset = edgeInsets;
  
  
  _homeListItemArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < 30; i++) {
    HomeListItem *item = [HomeListItem initWithTitle:@"会放大的header" titleFont:AdaptedFontSize(16) titleColor:[UIColor colorWithHexString:@"999999"] subTitle:@"enlargementHeaderAndNavi" subTitleFont:AdaptedFontSize(10) subTitleColor:[UIColor colorWithHexString:@"999999"] destVC:[EnlargementHeaderTableViewController class]];
    [_homeListItemArray addObject:item];
  }
  
}


#pragma mark - ** UITableViewDelegate *
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_homeListItemArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  HomeListTableViewCell *cell = [HomeListTableViewCell cellWithTableView:tableView];
  cell.item = _homeListItemArray[indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  HomeListItem *item = _homeListItemArray[indexPath.row];
  if(item.destVC)
  {
    UIViewController *vc = [[item.destVC alloc] init];
    if ([vc isKindOfClass:[UIViewController class]]) {
      vc.navigationItem.title = item.title;
      [self.navigationController pushViewController:vc animated:YES];
    }
  }
}

/** 是否显示底部黑线 */
- (BOOL)dqmNavigationIsHideBottomLine:(DQMNavigationBar *)navigationBar
{
  return YES;
}



@end
