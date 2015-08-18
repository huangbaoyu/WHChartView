//
//  WHChart.h
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHChart : UIView

@property (nonatomic, weak)     UIColor *colorOfBar;
@property (nonatomic, weak)     UIColor *colorOfTitle;
@property (nonatomic, weak)     UIColor *colorOfXYLabel;
@property (nonatomic, weak)     NSString *title;
@property (nonatomic, strong)   NSArray *xLabelString;
@property (nonatomic)           BOOL showGridding;
@property (nonatomic)           BOOL drawBarChart;
@property (nonatomic)           BOOL drawLineChart;

- (void)setChartData:(NSArray *)chartData;
- (void)strokeChart;

@end
