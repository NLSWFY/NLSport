//
//  UIImage+ZKSTint.h
//  ZhaiKerStepper
//
//  Created by gongcong on 14-9-25.
//  Copyright (c) 2014年 lx3d. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *) imageWithTintColor:(UIColor *)tintColor andSizeProgress:(float)progress;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

- (UIImage *)colorizeImageWithColor:(UIColor *)theColor;

//加水印
- (UIImage *)imageWithWatermark;


+ (UIImage *)nl_imageWithColor:(UIColor *)color;

+ (UIImage *)nl_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
