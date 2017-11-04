//
//  NLBaseModel.h
//  NiuLangSport
//
//  Created by shi ren on 2017/11/1.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NLBaseModel : NSObject
#define ProStr(str)       @property (nonatomic, copy) NSString *(str)
#define ProArr(arr)       @property (nonatomic, strong) NSArray *(arr)
#define ProInt(INt)       @property(nonatomic,assign)NSInteger (INt)
#define ProFlo(Flo)       @property(nonatomic,assign)float (Flo)
#define ProNum(num)       @property (nonatomic, strong) NSNumber *(num)
#define ProDict(dict)     @property(nonatomic,strong)NSDictionary * (dict)
@end
