//
//  NLPasswordViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/3.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLPasswordViewController.h"
#import "NLChooseSexViewController.h"

@interface NLPasswordViewController ()

@end

@implementation NLPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"牛郎运动" ;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)successRegisterBtnClick:(UIButton *)sender {
    if(_forgetPassword.length)
    {
        NLBaseTabBarViewController *tabbarVC = [NLBaseTabBarViewController new];
        [[[UIApplication sharedApplication] delegate] window].rootViewController = tabbarVC ;
        return ;
    }
    [self.navigationController pushViewController:[NLChooseSexViewController new] animated:YES];
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
