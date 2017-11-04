//
//  NLChooseSexViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/3.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLChooseSexViewController.h"
#import "NLChooseBodyViewController.h"

@interface NLChooseSexViewController ()

@end

@implementation NLChooseSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"牛郎运动" ;
     
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextBtnClick:(UIButton *)sender {
    [self.navigationController pushViewController:[NLChooseBodyViewController new] animated:YES];
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
