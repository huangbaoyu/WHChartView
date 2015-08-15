//
//  ViewController.m
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import "ViewController.h"
#import "WHChart.h"
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
    
    NSArray *temp = @[@123,@13,@87,@10,@16,@60,@51,@44];
    
    [chart setChartData:temp];
    [chart strokeChart];
    return chart;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
