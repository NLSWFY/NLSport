//
//  UIView+NLBorders.m
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "UIView+NLBorders.h"
#import <PureLayout/PureLayout.h>

@implementation UIView (NLBorders)

//////////
// Top
//////////

-(void)nl_addTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self nl_addTopBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andTopOffset:0];
}

//////////
// Top + Offset
//////////

-(void)nl_addTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset {
    UIView *borderView = [UIView new];
    [self addSubview:borderView];

    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:topOffset];
    [borderView autoSetDimension:ALDimensionHeight toSize:height];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:leftOffset];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:rightOffset];
    [borderView setBackgroundColor:color];
}


//////////
// Right
//////////

-(void)nl_addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self nl_addRightBorderWithWidth:width color:color rightOffset:0 topOffset:0 andBottomOffset:0];
}



//////////
// Right + Offset
//////////


-(void)nl_addRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    
    UIView *borderView = [UIView newAutoLayoutView];
    [self addSubview:borderView];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:rightOffset];
    [borderView autoSetDimension:ALDimensionWidth toSize:width];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:topOffset];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bottomOffset];
    [borderView setBackgroundColor:color];
}


//////////
// Bottom
//////////
-(void)nl_addBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self nl_addBottomBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andBottomOffset:0];
}



//////////
// Bottom + Offset
//////////

-(void)nl_addBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset {
    UIView *borderView = [UIView newAutoLayoutView];
    [self addSubview:borderView];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bottomOffset];
    [borderView autoSetDimension:ALDimensionHeight toSize:height];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:leftOffset];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:rightOffset];
    [borderView setBackgroundColor:color];
}



//////////
// Left
//////////

-(void)nl_addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self nl_addLeftBorderWithWidth:width color:color leftOffset:0 topOffset:0 andBottomOffset:0];
}

///------------
/// verMiddle Border 给view垂直方向中线加线，线框粗细和颜色可设定
///------------
-(void)nl_addVerMiddleLineWithWidth: (CGFloat)width andColor:(UIColor*)color
{
    UIView *borderView = [UIView newAutoLayoutView];
    [self addSubview:borderView];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [borderView autoSetDimension:ALDimensionHeight toSize:width];
    [borderView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [borderView setBackgroundColor:color];
}


//////////
// Left + Offset
//////////

-(void)nl_addLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset {
    
    UIView *borderView = [UIView newAutoLayoutView];
    [self addSubview:borderView];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:leftOffset];
    [borderView autoSetDimension:ALDimensionWidth toSize:width];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:topOffset];
    [borderView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bottomOffset];
    [borderView setBackgroundColor:color];
}

@end
