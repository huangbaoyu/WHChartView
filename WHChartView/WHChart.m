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
    CGPoint origin; //坐标原点
    CGPoint xEnd;   //x轴终点
    CGPoint yEnd;   //y轴终点
    float singleBarSpaceWidth; //单个柱状图所在区域的宽
    float barWidth; //柱状图的宽
    float barHeight;//柱状图总高度
    float spaceBetweenYandLeft; //Y轴与左边的距离
    float spaceBetweenXandBottom; //X轴与底边的距离
    int   max; //最大数值
    int   min;
    int   dataNumber;//数据个数
}

@property (nonatomic, strong) NSMutableArray *data; //存放数据
@property (nonatomic, strong) NSMutableArray *layers; //柱状图图层
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

- (void)commonInit
{
    spaceBetweenXandBottom = 25.0;
    spaceBetweenYandLeft = 25.0;
    xEnd = CGPointMake(self.frame.size.width - 10, self.frame.size.height -spaceBetweenXandBottom);
    yEnd = CGPointMake(spaceBetweenYandLeft , 10);
    origin = CGPointMake(spaceBetweenYandLeft, self.frame.size.height - spaceBetweenXandBottom);
    
    
    self.backgroundColor = [UIColor whiteColor];
    _backgroundColorofBar = self.backgroundColor;
    _colorofBar = [UIColor greenColor];
}

#pragma mark - Overwrite Setter
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    super.backgroundColor = backgroundColor;
    _backgroundColorofBar = backgroundColor;
}

- (void)setChartData:(NSArray *)chartData{
    _data = [NSMutableArray arrayWithArray:chartData];
    
    //根据数据个数 计算bar的各个数据
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
    NSLog(@"max = %d,min = %d",max,min);
}

#pragma mark - Drwa
- (void)drawRect:(CGRect)rect{
    if ([_data count] > 0) {
        [self drawAxis];
        [self drawLabel];
    }
}


- (void)drawLabel{
    [self drawXLabel];
    [self drawYLabel];
}

- (void)drawXLabel{
    for (NSInteger i ; i < [_data count]; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(
                                                                  spaceBetweenYandLeft + i * singleBarSpaceWidth,
                                                                  origin.y,
                                                                  singleBarSpaceWidth,
                                                                  spaceBetweenXandBottom)];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"7-28";
        label.backgroundColor = [UIColor clearColor];
        NSInteger fountSize = 4 +  singleBarSpaceWidth/( label.text.length > 1 ? label.text.length : 2 );
        label.font = [UIFont systemFontOfSize:fountSize < 17 ? fountSize:16];
        [self addSubview:label];
    }
}

- (void)drawYLabel{
    for (NSInteger i; i<5; ++i) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, origin.y - 10 - barHeight*i/4, spaceBetweenYandLeft*4/5, 20)];
        label.text =  @"10";
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12];
        //label.backgroundColor = [UIColor orangeColor];
        [self addSubview:label];
        
    }
}

//画坐标轴
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
    NSLog(@"drawAxis");
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
        
        bar.backgroundColorofBar = _backgroundColorofBar;
        //bar.colorofBar = _colorofBar;
        bar.percentage = percentage;
        [self addSubview:bar];
    }
    NSLog(@"strokeChart");
}

@end
