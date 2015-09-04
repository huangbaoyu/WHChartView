//
//  ViewController.m
//  WHChartViewDemo
//
//  Created by 王振辉 on 15/8/25.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import "ViewController.h"
#import "WHChartView.h"
#import "UIColor+WHColor.h"
@interface ViewController (){
    WHChartView *chart;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self chart1]];
    [self.view addSubview:[self chart2]];
    [self.view addSubview:[self chart3]];
    
}

- (WHChartView *)chart1
{
    chart = [[WHChartView alloc]initWithFrame:CGRectMake(20, 50, self.view.bounds.size.width - 40, 200)];
    
    NSArray *dataValue = @[@123.5,@122,@87,@101.1,@16,@60.6,@51,@44,@20,@18,@98,@110,@19,@77];
    NSArray *xLabelString = @[@"6-10",@"6-11",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17"];
    
    //chart.backgroundColor = [UIColor grayColor];
    chart.xLabelString = xLabelString;
    chart.title = @"Bar and Line";
    chart.showsGridding = YES;
    chart.showsGradientColor = YES;
    chart.drawsBarChart = YES;
    chart.drawsLineChart = YES;
    chart.smoothesLine = YES;
    chart.colorOfAxis = [UIColor whClouds];
    chart.colorOfGridding = [UIColor whClouds];
    chart.colorOfLine = [UIColor grayColor];
    //chart.colorOfTitle = [UIColor blackColor];
    chart.colorOfXYLabel = [UIColor lightGrayColor];
    chart.colorOfBar = [UIColor whAsbestos];
    
    [chart setChartData:dataValue];
    [chart strokeChart];
    
    return chart;
}

- (WHChartView *)chart2
{
    chart = [[WHChartView alloc]initWithFrame:CGRectMake(20, 250, self.view.bounds.size.width - 40, 200)];
    
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:140];
    for(int i=0;i<140;i++) {
        float r = rand()%100 /100.0  + 7.0 - i/20.0;
        [data addObject:[NSNumber numberWithFloat:r]];
    }
    
    chart.backgroundColor = [UIColor whiteColor];
    chart.title = @"Line Only";
    chart.showsGridding = YES;
    chart.showsXLabel = NO;
    chart.showsGradientColor = YES;
    chart.drawsBarChart = NO;
    chart.drawsLineChart = YES;
    chart.smoothesLine = YES;
    chart.colorOfAxis = [UIColor whClouds];
    chart.colorOfGridding = [UIColor whClouds];
    chart.colorOfLine = [UIColor grayColor];
    chart.lineWidth = 1.0;

    chart.gradientColors = [NSArray arrayWithObjects:(id)[UIColor whAlizarin].CGColor ,(id)[UIColor whCarrot].CGColor,(id)[UIColor whLightBlue].CGColor, nil];
    
    [chart setChartData:data];
    [chart strokeChart];
    
    return chart;
}

- (WHChartView *)chart3
{
    chart = [[WHChartView alloc]initWithFrame:CGRectMake(20, 450, self.view.bounds.size.width - 40, 200)];
    
    NSArray *dataValue = @[@123.5,@122,@87,@101.1,@16,@60.6,@51,@44,@20,@18,@98,@110,@19,@77];
    NSArray *xLabelString = @[@"6-10",@"6-11",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17"];
    
    //chart.backgroundColor = [UIColor grayColor];
    chart.xLabelString = xLabelString;
    chart.title = @"Bar Only";
    chart.showsGridding = YES;
    chart.showsGradientColor = YES;
    chart.drawsBarChart = YES;
    chart.drawsLineChart = NO;
    chart.smoothesLine = YES;
    chart.colorOfAxis = [UIColor whClouds];
    chart.colorOfGridding = [UIColor whClouds];
    chart.colorOfLine = [UIColor grayColor];
   // chart.colorOfTitle = [UIColor blackColor];
    chart.colorOfUnusedPartOfBar = [UIColor grayColor];
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

