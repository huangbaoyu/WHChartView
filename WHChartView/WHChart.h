//
//  WHChart.h
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHChart : UIView

//@property (nonatomic, weak) UIColor *backgroundColorofBar;
@property (nonatomic, weak) UIColor *colorofBar;
@property (nonatomic, weak) NSString *title;
@property (nonatomic)       BOOL showGridding;

- (void)setChartData:(NSArray *)chartData;
- (void)strokeChart;

@end
