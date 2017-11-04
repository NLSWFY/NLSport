//
//  NLLoginViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/3.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLLoginViewController.h"

@interface NLLoginViewController ()

@end

@implementation NLLoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO ;
    self.title = @"牛郎运动" ;
    //  self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}
- (IBAction)finishBtnClick:(UIButton *)sender {
    NLBaseTabBarViewController *tabbarVC = [NLBaseTabBarViewController new];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = tabbarVC ;
}
- (IBAction)forgertBtnClick:(UIButton *)sender {
    NLRegisterViewController *VC =  [NLRegisterViewController new] ;
    VC.forgetPassword = @"1" ;
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
