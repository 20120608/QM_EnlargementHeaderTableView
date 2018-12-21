//
//  EnlargementHeaderTableViewController.m
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "EnlargementHeaderTableViewController.h"
#import "DQMExpandHeader.h"
#import "DQMExpandImageView.h"

#define HEADER_TOP 150 //滚动到多少导航栏变不透明

@interface EnlargementHeaderTableViewController ()
{
  UIStatusBarStyle _statusBarStyle; /*要想改变状态栏的颜色要在plist配置 View controller-based status bar appearance 为YES*/
}

@property (nonatomic, strong) DQMExpandHeader *expandHander;

@end

@implementation EnlargementHeaderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  UIEdgeInsets edgeInsets = self.tableView.contentInset;
  edgeInsets.top -= NAVIGATION_BAR_HEIGHT;
  self.tableView.contentInset = edgeInsets;
  
  UIImageView *imageView = [[DQMExpandImageView alloc] initWithImage:[UIImage imageNamed:@"img_header"]];
  imageView.height = 274;
  imageView.width = kScreenWidth;
  _expandHander = [DQMExpandHeader expandWithScrollView:self.tableView expandView:imageView];
  _statusBarStyle = UIStatusBarStyleLightContent;
  
}



#pragma mark - tableView Scroll delegate
//滚动的视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  
  NSLog(@"offset---scroll:%f",self.tableView.contentOffset.y);
  UIColor *color = [UIColor whiteColor];
  CGFloat offset = scrollView.contentOffset.y;
  
  NSString *navititle = @"富文本标题";
  if (offset + HEADER_TOP < 0) {
    
    self.dqm_navgationBar.title = [QMSGeneralHelpers changeStringToMutableAttributedStringTitle:navititle font:AdaptedBoldFont(16) rangeOfFont:NSMakeRange(0, navititle.length) color:QMHexColor(@"ffffff") colorOfFont:NSMakeRange(0, navititle.length)];
    self.dqm_navgationBar.backgroundColor = [color colorWithAlphaComponent:0];
    self.dqm_navgationBar.titleView.alpha = 0.01;
    _statusBarStyle = UIStatusBarStyleLightContent;//白色
    
  } else {
    CGFloat alpha = 1 - ( ( 64- offset - HEADER_TOP ) / 64 );
    self.dqm_navgationBar.title = [QMSGeneralHelpers changeStringToMutableAttributedStringTitle:navititle font:AdaptedBoldFont(16) rangeOfFont:NSMakeRange(0, navititle.length) color:QMHexColor(@"373A3F") colorOfFont:NSMakeRange(0, navititle.length)];
    self.dqm_navgationBar.backgroundColor = [color colorWithAlphaComponent:alpha];
    self.dqm_navgationBar.titleView.alpha = alpha;
    _statusBarStyle = UIStatusBarStyleDefault;//黑色
  }
  [self setNeedsStatusBarAppearanceUpdate];//重新设置状态栏

  
}



#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] init];
  cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
  return cell;
}








#pragma mark - navi delegate
-(BOOL)navUIBaseViewControllerIsNeedNavBar:(DQMNavUIBaseViewController *)navUIBaseViewController
{
  return YES;
}

- (BOOL)dqmNavigationIsHideBottomLine:(DQMNavigationBar *)navigationBar
{
  return true;
}


#pragma mark - statusBar
/**
 状态栏是否隐藏
 */
-(BOOL)prefersStatusBarHidden {
  return false;
}


/**
 状态栏样式  要想改变状态栏的颜色要在plist配置 View controller-based status bar appearance 为YES
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
  return _statusBarStyle;
}

/**
 状态栏变化动画效果:渐变
 */
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
  return UIStatusBarAnimationFade;
}



- (void)dealloc
{
  NSLog(@"remove");
  [[NSNotificationCenter defaultCenter] postNotificationName:DQMTableViewControllerDeallocNotification object:self];
}


@end
