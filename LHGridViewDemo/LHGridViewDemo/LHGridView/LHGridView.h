//
//  LHGridView.h
//  LHGridViewDemo
//
//  Created by helly on 15/11/8.
//  Copyright © 2015年 com.dnetzj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHGridView : UIView


@property(nonatomic,strong)UIView *titleLeftView;
@property(nonatomic,strong)UIView *titleRightView;


@property(nonatomic,strong)UIScrollView *bodyScrollView;
@property(nonatomic,strong)UIView *bodyLeftView;
@property(nonatomic,strong)UIScrollView *bodyRightScrollView;
@property(nonatomic,strong)UIView *bodyRightScrollViewSubview;

@property(nonatomic,assign)NSInteger columnNum;//总列数
@property(nonatomic,assign)NSInteger fixRow;//固定行数
@property(nonatomic,assign)NSInteger fixCol;//固定列数
@property(nonatomic,assign)NSInteger rowHeight;//行高

@property(nonatomic,assign)BOOL isTitleSepLine;//是否显示分割线
@property(nonatomic,assign)BOOL isBodySepLine;
@property(nonatomic,strong)UIColor *sepTitleLineColor;//分割线颜色
@property(nonatomic,strong)UIColor *sepBodyLineColor;//分割线颜色

@property(nonatomic,strong)NSArray *dataSource;//数据源@[@[],@[]] 包含表头和表体

@property(nonatomic,strong)NSArray *columnsWidthArr;//列宽的数组 @["100",@"90",@"100"]

@property(nonatomic,strong)NSArray *titleMergeArr;//标题合并数组 @[@{@"col":@"2",@"row":@"0",@"span":@"2"}] （第2列 第0行 合并后面的2个单元格）

@property(nonatomic,strong)UIColor *titleBgColor;//表头背景色
@property(nonatomic,strong)UIColor *bodyLeftEvenBgColor;//表体左边偶数行背景色
@property(nonatomic,strong)UIColor *bodyLeftUnEvenBgColor;//表体左边奇数行背景色
@property(nonatomic,strong)UIColor *bodyRigtEvenBgColor;
@property(nonatomic,strong)UIColor *bodyRightUnEvenBgColor;

@property(nonatomic,strong)UIFont *titleFont;
@property(nonatomic,strong)UIFont *bodyFont;

@property(nonatomic,strong)UIColor *titleFontColor;
@property(nonatomic,strong)UIColor *bodyFontColor;

@end
