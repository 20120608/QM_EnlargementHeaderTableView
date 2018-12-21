//
//  HomeListItem.h
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/19.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListItem : NSObject

/** 需要跳转的目标对象类名 */
@property(nonatomic,assign) Class   destVC;

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 标题的字体 */
@property (nonatomic, strong) UIFont *titleFont;
/** 主标题的颜色 */
@property (nonatomic, strong) UIColor *titleColor;

/** 副标题 */
@property (nonatomic, copy) NSString *subTitle;
/** 副标题的字体 */
@property (nonatomic, strong) UIFont *subTitleFont;
/** 副标题的颜色 */
@property (nonatomic, strong) UIColor *subTitleColor;

+(instancetype)initWithTitle:( NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor subTitle:(NSString *)subTitle subTitleFont:(UIFont *)subTitleFont subTitleColor:(UIColor *)subTitleColor destVC:(Class)destVC;

@end


