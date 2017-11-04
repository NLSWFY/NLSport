//
//  UIView+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  创建一个蒙板
 *
 *  @param target 处理事件的对象
 *  @param action 处理事件的方法
 *  @param alpha  蒙板的透明度 0.0~1.0之间
 *
 *  @return 返回一个蒙板
 */
+ (UIView *)viewMaskWithTarget:(id)target action:(SEL)action;
//
//+ (UIView *)viewParentWithTitle:(NSString *)title Target:(id)target action:(SEL)action content:(NSString *)content;



@end
