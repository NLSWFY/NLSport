//
//  NLKcalCuonsumeView.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLKcalCuonsumeView.h"

@interface NLKcalCuonsumeView ()
{
    CGFloat lineWidth ; //线条宽度
    CGPoint center ;
    CGFloat radius ;  //圆的半径
    UIColor *lineColor ; //线条颜色
    
    
}
@end

@implementation NLKcalCuonsumeView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    lineColor = [UIColor whiteColor];
    lineWidth = 2.0 ;
    center = self.center ;
    radius =  IS_IPHONE_6P?65:(IS_IPHONE_6 ? 57:48) + 3 ;
    UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:(CGFloat) 3*M_PI_2 endAngle:(CGFloat)(6) clockwise:YES];
    [lineColor setStroke];
    progressCircle.lineWidth =  lineWidth;
    progressCircle.lineCapStyle = kCGLineCapRound ;
    progressCircle.lineJoinStyle = kCGLineJoinRound ;
    [progressCircle stroke];
    
    
    
}

@end
