//
//  WHChart.h
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHChartView : UIView

/***  Coordinate ***/
@property (nonatomic, strong)   NSString *title;
@property (nonatomic, strong)   UIColor *colorOfTitle;
@property (nonatomic, strong)   UIColor *colorOfXYLabel;
@property (nonatomic, strong)   UIColor *colorOfAxis;
@property (nonatomic, strong)   UIColor *colorOfGridding;
@property (nonatomic)           BOOL showGridding;
@property (nonatomic)           BOOL showXLabel;
@property (nonatomic, strong)   NSArray *xLabelString;  //Data of XLabel


/***  Bar in Chart ***/
@property (nonatomic)           BOOL drawBarChart;
@property (nonatomic, strong)   UIColor *colorOfBar;
@property (nonatomic, strong)   UIColor *colorOfUnusedPartOfBar;
@property (nonatomic)           CFTimeInterval animationDurationOfBar; //animationDuration


/***  Line in Chart ***/
@property (nonatomic)           BOOL drawLineChart;
@property (nonatomic)           CGFloat lineWidth;
@property (nonatomic, strong)   UIColor *colorOfLine;
@property (nonatomic)           CFTimeInterval animationDurationOfLine;

@property (nonatomic)           BOOL smoothLine;        //BazierPath
@property (nonatomic)           CGFloat kOfBezierPath;

@property (nonatomic)           BOOL showGradientColor; //GradientColor
@property (nonatomic, strong)   NSArray *gradientColors;
@property (nonatomic, strong)   NSArray *gradientLocations;
@property (nonatomic)           CGPoint gradientStartPoint;
@property (nonatomic)           CGPoint gradientEndPoint;

- (void)setChartData:(NSArray *)chartData;
- (void)strokeChart;

@end
