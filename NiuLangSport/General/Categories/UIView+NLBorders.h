//
//  UIView+NLBorders.h
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NLBorders)

///------------
/// Top Border  给view增加top边框，边框粗细和颜色可设定
///------------
-(void)nl_addTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


///------------
/// Top Border + Offsets
///------------
-(void)nl_addTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;

///------------
/// Right Border 给view增加right边框，边框粗细和颜色可设定
///------------
-(void)nl_addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;

///------------
/// Right Border + Offsets
///------------
-(void)nl_addRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;

///------------
/// Bottom Border 给view增加bottom边框，边框粗细和颜色可设定
///------------
-(void)nl_addBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;

///------------
/// Bottom Border + Offsets
///------------
-(void)nl_addBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;

///------------
/// Left Border 给view增加left边框，边框粗细和颜色可设定
///------------

-(void)nl_addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;

///------------
/// verMiddle Border 给view垂直方向中线加线，线框粗细和颜色可设定
///------------
-(void)nl_addVerMiddleLineWithWidth: (CGFloat)width andColor:(UIColor*)color;

///------------
/// Left Border + Offsets
///------------

-(void)nl_addLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;

@end
