//
//  ViewController.m
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import "ViewController.h"
#import "WHChart.h"
#import "UIColor+WHColor.h"
@interface ViewController (){
    WHChart *chart;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view  addSubview:[self chart1]];
}

- (WHChart *)chart1
{
    chart = [[WHChart alloc]initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 200)];
    
    NSArray *dataValue = @[@123.5,@122,@87,@101.1,@16,@60.6,@51,@44];
    NSArray *xLabelString = @[@"6-10",@"6-11",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17"];
    
    //chart.backgroundColor = [UIColor grayColor];
    chart.xLabelString = xLabelString;
    //chart.title = @"用电数据";
    chart.showGridding = YES;
    chart.drawBarChart = YES;
    chart.drawLineChart = YES;
    chart.colorOfLine = [UIColor grayColor];
    chart.colorOfTitle = [UIColor blackColor];
    chart.colorOfXYLabel = [UIColor lightGrayColor];
    chart.colorOfBar = [UIColor whLightBlue];
    
    [chart setChartData:dataValue];
    [chart strokeChart];
    
    return chart;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
