//
//  WHChart.m
//  WHChartView
//
//  Created by 王振辉 on 15/8/15.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import "WHChart.h"
#import "WHChartBar.h"
@interface WHChart (){
    CGPoint origin;                 //origin of coordinates
    CGPoint xEnd;                   //terminal point of X-axis
    CGPoint yEnd;                   //terminal point of Y-axis
    float singleBarSpaceWidth;      //Width of space where bar is in
    float barWidth;                 //Width of bar
    float barHeight;                //height of bar
    float spaceBetweenYandLeft;     //distance between Y-axis and left side of chart
    float spaceBetweenXandBottom;   //distance between X-axis and bottom side of chart
    int   max;                      //max number of data
    int   min;                      //min number of data
}

@property (nonatomic, strong) NSMutableArray *data;     //store data
@property (nonatomic, strong) NSMutableArray *layers;   //store layers
@end

@implementation WHChart

#pragma mark - Init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

//init property and some default
- (void)commonInit
{
    spaceBetweenXandBottom = 25.0 - 2;
    spaceBetweenYandLeft = 25.0 +8;
    xEnd = CGPointMake(self.frame.size.width - 2, self.frame.size.height -spaceBetweenXandBottom);
    yEnd = CGPointMake(spaceBetweenYandLeft , 10);
    origin = CGPointMake(spaceBetweenYandLeft, self.frame.size.height - spaceBetweenXandBottom);
    
    self.backgroundColor = [UIColor whiteColor];
    _colorOfBar = [UIColor greenColor];
    _colorOfTitle = [UIColor blackColor];
    _colorOfXYLabel = [UIColor blackColor];
}

#pragma mark - Overwrite Setter
- (void)setChartData:(NSArray *)chartData
{
    _data = [NSMutableArray arrayWithArray:chartData];
    
    //circulate information of bar establish in chartData
    singleBarSpaceWidth = (xEnd.x - spaceBetweenYandLeft)/[chartData count]; //默认7个数据。
    barWidth = singleBarSpaceWidth*2/3;
    barHeight = origin.y - yEnd.y -9;
    
    [self findMaxAndMinNumberOfData];
}


#pragma mark - Calcalate
- (void)findMaxAndMinNumberOfData
{
    max = -1000;
    min = 1000;
    for (NSNumber *i in _data) {
        if ( max < i.intValue) {
            max = i.intValue;
        }else if(min > i .intValue){
            min = i.intValue;
        }
    }
}

#pragma mark - Drwa
- (void)drawRect:(CGRect)rect
{
    if ([_data count] > 0) {
        [self drawAxis];
        [self drawGridding];
        [self drawLabel];
    }
}

- (void)drawLabel
{
    [self drawXLabel];
    [self drawYLabel];
    [self drawTitleLabel];
}

- (void)drawXLabel
{
    if (!_xLabelString || [_xLabelString count]!=[_data count]) {
        return;
    }
    
    
    for (NSInteger i = 0 ; i < [_data count]; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(
                                                                  spaceBetweenYandLeft + i * singleBarSpaceWidth,
                                                                  origin.y,
                                                                  singleBarSpaceWidth,
                                                                  spaceBetweenXandBottom)];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.text = _xLabelString[i];
        label.textColor = _colorOfXYLabel;
        label.backgroundColor = [UIColor clearColor];
        NSInteger fountSize = 4 +  singleBarSpaceWidth/( label.text.length > 1 ? label.text.length : 2 );
        label.font = [UIFont systemFontOfSize:fountSize < 17 ? fountSize:16];
        [self addSubview:label];
    }
}

- (void)drawYLabel
{
    for (NSInteger i = 0; i<5; ++i) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, origin.y - 10 - barHeight*i/4, spaceBetweenYandLeft*9/10, 20)];
        label.text =  [NSString stringWithFormat:@"%ld",max*i/4];
        label.textColor = _colorOfXYLabel;
        label.backgroundColor = self.backgroundColor;
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
    }
}

- (void)drawTitleLabel
{
    if (!_title) {
        return;
    }
    
    UILabel *label = [[UILabel alloc]init];
    label.text = _title;
    label.textColor = _colorOfTitle;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:label];
    NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:label
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterX
                                                                       multiplier:1.0
                                                                         constant:0];
    NSDictionary *metrics = @{@"height":@(origin.y - barHeight)};
    NSDictionary *views = @{@"label":label};
    NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label(==height)]"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:views];
    [self addConstraint:centerConstraint];
    [self addConstraints:heightConstraints];
}

- (void)drawAxis
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 127.0/255.0, 140.0/255.0, 141.0/255.0, 1); //rgba(127, 140, 141,1.0)
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, xEnd.x, xEnd.y);
    CGPathAddLineToPoint(path, NULL, origin.x, origin.y);
    CGPathAddLineToPoint(path, NULL, yEnd.x, yEnd.y);
    
    CGContextAddPath(context, path);
    
    CGContextStrokePath(context);
    CGPathRelease(path);
}

- (void)drawGridding
{
    if (!_showGridding) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetRGBStrokeColor(context, 189.0/255.0, 195.0/255.0, 199.0/255.0, 0.8);//rgb(189, 195, 199)
    for (NSInteger i = 1; i<5 ; ++i) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, origin.x, origin.y - barHeight*i/4);
        CGPathAddLineToPoint(path, NULL, xEnd.x, origin.y - barHeight*i/4);
        
        CGContextAddPath(context, path);
        CGContextStrokePath(context);
        CGPathRelease(path);
    }

    
}

-(void)strokeChart
{
    for (NSInteger i = 0; i < [_data count]; ++i) {
        float percentage = [_data[i] floatValue] / max;
        
        WHChartBar *bar = [[WHChartBar alloc]initWithFrame:CGRectMake(
                                      spaceBetweenYandLeft + i * singleBarSpaceWidth +(singleBarSpaceWidth-barWidth)/2,
                                      origin.y - barHeight ,
                                      barWidth,
                                      barHeight)];
        bar.labelValue = [_data[i] floatValue];
        bar.backgroundColorofChart = self.backgroundColor;
        bar.colorofBar = _colorOfBar;
        bar.percentage = percentage;
        [self addSubview:bar];
    }
}

@end
