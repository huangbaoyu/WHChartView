# WHChartView

![License](https://img.shields.io/badge/License-MIT-orange.svg)
![Pod](https://img.shields.io/badge/Pod-v1.0.3-green.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-bl.svg)

## GIF

![screen{](https://raw.githubusercontent.com/wongkoo/WHChartView/master/Presentation/WHChartView1-0-3.gif)

## Usage

### CocoaPods

CocoaPods is the recommended way to use WHChartView in your project.    

- Simply add this line to your **Podfile**: 
  
  `pod 'WHChartView'`
  
- Run `pod install`.

Include with `#import "WHChartView.h"` to use it wherever you need.

### Init

``` objc
WHChartView *chart = [[WHChartView alloc]initWithFrame:(CGRect)rect];
```

### Required

``` objc
- (void)setChartData:(NSArray *)chartData;
- (void)strokeChart;
```

### Optional

``` objc
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
```



### Demo

``` objc
    WHChartView *chart = [[WHChartView alloc]initWithFrame:CGRectMake(20, 50, self.view.bounds.size.width - 40, 200)];

    NSArray *dataValue = @[@123.5,@122,@87,@101.1,@16,@60.6,@51,@44,@20,@18,@98,@110,@19,@77];
    NSArray *xLabelString = @[@"6-10",@"6-11",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17"];

    //chart.backgroundColor = [UIColor grayColor];
    chart.xLabelString = xLabelString;
    chart.title = @"Bar and Line";
    chart.showGridding = YES;
    chart.showGradientColor = YES;
    chart.drawBarChart = YES;
    chart.drawLineChart = YES;
    chart.smoothLine = YES;
    chart.colorOfAxis = [UIColor whClouds];
    chart.colorOfGridding = [UIColor whClouds];
    chart.colorOfLine = [UIColor grayColor];
    chart.colorOfTitle = [UIColor blackColor];
    chart.colorOfXYLabel = [UIColor lightGrayColor];
    chart.colorOfBar = [UIColor whLightBlue];

    [chart setChartData:dataValue];
    [chart strokeChart];

    [self.view addSubview:chart];
```

### LICENSE

The MIT License (MIT)    

Copyright (c) 2015 wongkoo    

Permission is hereby granted, free of charge, to any person obtaining a copy

of this software and associated documentation files (the "Software"), to deal

in the Software without restriction, including without limitation the rights

to use, copy, modify, merge, publish, distribute, sublicense, and/or sell

copies of the Software, and to permit persons to whom the Software is

furnished to do so, subject to the following conditions:    

The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.    

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.    