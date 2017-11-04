//
//  NLHomepagePartOne.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/3.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLHomepagePartOne.h"



@implementation NLHomepagePartOne

//
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 -(void)awakeFromNib
{
   
    [super awakeFromNib];
     
    if(IS_IPHONE_6)
    {
        _userImageWidthC.constant = 110.0 ;
    }else if (IS_IPHONE_6P)
    {
        _userImageWidthC.constant = 120.0 ;
    }else
    {
        _userImageWidthC.constant = 95.0 ;
        
    }
    _userImageView.layer.cornerRadius = _userImageWidthC.constant /2 ;
    
  
    [self  addGradientView];
  
    
}

#pragma mark -- 拉背景渐变
-(void)addGradientView
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.frame ;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)NavTextColor.CGColor,
                       // (id)RGBA(237, 52, 34, 0.7).CGColor,
                       (id)RGBA(248,111,69,1).CGColor, nil];
  
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    [self.layer addSublayer:gradient];
    
    [self bringSubviewToFront:_bgView];
}

@end
