//
//  WHChart.h
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHChart : UIView

//Color
@property (nonatomic, strong)   UIColor *colorOfBar;
@property (nonatomic, strong)   UIColor *colorOfTitle;
@property (nonatomic, strong)   UIColor *colorOfLine;
@property (nonatomic, strong)   UIColor *colorOfXYLabel;

//Data
@property (nonatomic, strong)   NSString *title;
@property (nonatomic, strong)   NSArray *xLabelString;

//BOOL Switch
@property (nonatomic)           BOOL showGridding;
@property (nonatomic)           BOOL drawBarChart;
@property (nonatomic)           BOOL drawLineChart;

- (void)setChartData:(NSArray *)chartData;
- (void)strokeChart;

@end
