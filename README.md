# WHChart

![screen{](https://raw.githubusercontent.com/wongkoo/WHChartView/master/Presentation/WHChartGif.gif)

## Usage

### Init

``` objc
WHChart *chart = [[WHChart alloc]initWithFrame:(CGRect)rect];
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
@property (nonatomic, strong)   NSArray *xLabelString;  //Data of XLabel


/***  Bar in Chart ***/
@property (nonatomic)           BOOL drawBarChart;
@property (nonatomic, strong)   UIColor *colorOfBar;


/***  Line in Chart ***/
@property (nonatomic)           BOOL drawLineChart;
@property (nonatomic, strong)   UIColor *colorOfLine;

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
    WHChart *chart = [[WHChart alloc]initWithFrame:CGRectMake(20, 250, self.view.bounds.size.width - 40, 200)];
    
    NSArray *dataValue = @[@123.5,@122,@87,@101.1,@16,@60.6,@51,@44,@20,@18,@98,@110,@19,@77];
    NSArray *xLabelString = @[@"6-10",@"6-11",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17",@"6-12",@"6-13",@"6-14",@"6-15",@"6-16",@"6-17"];
    
    chart.backgroundColor = [UIColor whiteColor];
    chart.xLabelString = xLabelString;
    chart.title = @"Line Only";
    chart.showGridding = YES;
    chart.showGradientColor = YES;
    chart.drawBarChart = NO;
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
