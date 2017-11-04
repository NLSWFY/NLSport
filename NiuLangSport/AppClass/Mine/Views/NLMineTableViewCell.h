//
//  NLMineTableViewCell.h
//  NiuLangSport
//
//  Created by shi ren on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLMeModel.h"

@interface NLMineTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *mineNameLB;
@property (strong, nonatomic) IBOutlet UIImageView *mineIV;
@property (strong, nonatomic) IBOutlet UIView *lineView;
-(void)configUI:(NLMeModel *)model ;
@end
