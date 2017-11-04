//
//  UIColor+Extension.h
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface UIColor (Extension)

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)nl_colorWithHexString:(NSString *)color;
+ (UIColor *)nl_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
