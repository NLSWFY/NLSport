//
//  UIView+IBDesignable.h
//  Pinder
//
//  Created by Anton Bukov on 31.10.15.
//  Copyright (c) 2015 Happy Santa. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (IBDesignable)

@property (nonatomic, assign) IBInspectable BOOL lShouldRasterize;
@property (nonatomic, assign) IBInspectable BOOL lMasksToBounds;
@property (nonatomic, assign) IBInspectable CGFloat lCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat lBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor *lBorderColor;

@property (nonatomic, strong) IBInspectable UIColor *lShadowColor;
@property (nonatomic, assign) IBInspectable CGFloat lShadowOpacity;
@property (nonatomic, assign) IBInspectable CGFloat lShadowRadius;
@property (nonatomic, assign) IBInspectable CGSize lShadowOffset;

@end

//

IB_DESIGNABLE
@interface UILabel (IBDesignable)

@property (nonatomic, assign) IBInspectable CGFloat paragraphLineHeight;

@end
