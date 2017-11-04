//
//  UIView+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIView+Extension.h"


@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

+ (UIView *)viewMaskWithTarget:(id)target action:(SEL)action {
    
    UIView *mask = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    mask.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mengban.png"]];
    mask.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [mask addGestureRecognizer:tap];
    
    [[[UIApplication sharedApplication].windows firstObject] addSubview:mask];
    
    return mask;
}

//+ (UIView *)viewParentWithTitle:(NSString *)title Target:(id)target action:(SEL)action content:(NSString *)content {
//    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, SCREEN_HEIGHT-44-64-36*2)];
//    parentView.backgroundColor = [UIColor whiteColor];
//    [[[UIApplication sharedApplication].windows firstObject] addSubview:parentView];
//    
//    UILabel *protocolLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, parentView.width-15*2, 20)];
//    protocolLb.text = title;
//    protocolLb.font = [UIFont systemFontOfSize:15];
//    protocolLb.textColor = [UIColor blackColor];
//    [parentView addSubview:protocolLb];
//        
//    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    closeBtn.frame = CGRectMake(parentView.width-10, -10, 20, 20);
//    [closeBtn setBackgroundImage:[UIImage imageNamed:@"yuancha"] forState:UIControlStateNormal];
//    [closeBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [parentView addSubview:closeBtn];
//        
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(protocolLb.x, CGRectGetMaxY(protocolLb.frame)+10, protocolLb.width, parentView.height-protocolLb.y-CGRectGetMaxY(protocolLb.frame)-10)];
//    textView.textColor = titleColor;
//    textView.font = [UIFont systemFontOfSize:12];
//    textView.editable = NO;
//    textView.text = content;
//    [parentView addSubview:textView];
//    
//    return parentView;
//}
//


@end
