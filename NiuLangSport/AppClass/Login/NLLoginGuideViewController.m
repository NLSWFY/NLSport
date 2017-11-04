//
//  NLLoginGuideViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/2.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLLoginGuideViewController.h"

IB_DESIGNABLE
@interface NLLoginGuideViewController ()

@end

@implementation NLLoginGuideViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES ;
}
- (IBAction)registerBtnClick:(id)sender {
    [self.navigationController pushViewController:[NLRegisterViewController new] animated:YES];
}
- (IBAction)loginBtnClick:(UIButton *)sender {
     [self.navigationController pushViewController:[NLLoginViewController new] animated:YES];
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
