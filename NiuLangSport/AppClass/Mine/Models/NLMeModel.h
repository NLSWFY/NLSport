//
//  NLMeModel.h
//  NiuLangSport
//
//  Created by shi ren on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLBaseModel.h"

@interface NLMeModel : NLBaseModel

typedef enum
{
    
    NL_ME_COURSE,       //课程
    
    NL_ME_CARD,       //会员卡
    NL_ME_ABOUT_ME,       //与我相关
    
    
    NL_ME_HEALTHKIT,       //HealthKit（暂时）
    
    NL_ME_FRIEND_INVITE,  //朋友邀请
 
    
    
}NL_ME_TYPE;

@property(nonatomic,strong)NSString *imageURL;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NL_ME_TYPE meType;

@end
