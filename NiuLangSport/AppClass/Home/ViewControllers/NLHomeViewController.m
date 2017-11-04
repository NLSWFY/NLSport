//
//  NLHomeViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/2.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLHomeViewController.h"
#import "NLHomepagePartOne.h"
#import "NLHomepagePartTwo.h"
#import "NLHomepagePartThree.h"
#import "NLKcalCuonsumeView.h"

@interface NLHomeViewController ()

@end

@implementation NLHomeViewController


- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
     [ self.navigationController.navigationBar setHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.tabBarItem.badgeValue = @"666" ;
    [self addUI];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark -- ui
-(void)addUI
{
    /****** 分三块区域，根据屏幕高度做适配 ******/
    CGFloat partOneHeight = 290.0/667 *SCREEN_H ;
    NLHomepagePartOne *partOne = [[[NSBundle mainBundle]loadNibNamed:@"NLHomepagePartOne" owner:self options:nil] lastObject];
    partOne.frame = (CGRect){0,0,SCREEN_W,partOneHeight};
    [self.view addSubview:partOne];
    
    NLKcalCuonsumeView *cuonsumeView  =  [[NLKcalCuonsumeView alloc]initWithFrame:(CGRect){0,0,SCREEN_W,partOneHeight}];
    cuonsumeView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cuonsumeView];
    
    CGFloat partTwoHeight = 80.0/667 * SCREEN_H ;
    NLHomepagePartTwo *partTwo = [[[NSBundle mainBundle]loadNibNamed:@"NLHomepagePartTwo" owner:self options:nil] lastObject];
    partTwo.frame = (CGRect){0,CGRectGetMaxY(partOne.frame),SCREEN_W,partTwoHeight};
    [self.view addSubview:partTwo];
    
    
     CGFloat partThreeHeight = 246.0/667 *SCREEN_H ;
    NLHomepagePartThree *partThree = [[[NSBundle mainBundle]loadNibNamed:@"NLHomepagePartThree" owner:self options:nil] lastObject];
    partThree.frame = (CGRect){0,CGRectGetMaxY(partTwo.frame),SCREEN_W,partThreeHeight};
    [self.view addSubview:partThree];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    //1.创建转场动画对象
//    CATransition *transition=[[CATransition alloc]init];
//    transition.type = @"cube" ;
//    transition.subtype=  @"fromTop" ;
//    transition.duration = 1.5 ;
//    testView.backgroundColor = [UIColor greenColor];
//    //加载动画
//    [testView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
