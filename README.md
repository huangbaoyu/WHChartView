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
@property (nonatomic)           BOOL showsGridding;
@property (nonatomic)           BOOL showsXLabel;
@property (nonatomic, strong)   NSArray *xLabelString;  //Data of XLabel


/***  Bar in Chart ***/
@property (nonatomic)           BOOL drawsBarChart;
@property (nonatomic, strong)   UIColor *colorOfBar;
@property (nonatomic, strong)   UIColor *colorOfUnusedPartOfBar;
@property (nonatomic)           CFTimeInterval animationDurationOfBar; //animationDuration


/***  Line in Chart ***/
@property (nonatomic)           BOOL drawsLineChart;
@property (nonatomic)           CGFloat lineWidth;
@property (nonatomic, strong)   UIColor *colorOfLine;
@property (nonatomic)           CFTimeInterval animationDurationOfLine;

@property (nonatomic)           BOOL smoothesLine;        //BazierPath
@property (nonatomic)           CGFloat kOfBezierPath;

@property (nonatomic)           BOOL showsGradientColor; //GradientColor
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
    chart.showsGridding = YES;
    chart.showsGradientColor = YES;
    chart.drawsBarChart = YES;
    chart.drawsLineChart = YES;
    chart.smoothesLine = YES;
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

WHChartView is available under the MIT license. See the [LICENSE](https://github.com/wongkoo/WHChartView/blob/master/LICENSE) file for more info.