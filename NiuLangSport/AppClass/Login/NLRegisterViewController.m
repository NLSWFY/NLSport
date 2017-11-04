//
//  NLRegisterViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/2.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLRegisterViewController.h"


@interface NLRegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation NLRegisterViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO ;
    self.title = @"牛郎运动" ;
  //  self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}
- (IBAction)getCodeBtnClick:(UIButton *)sender {
    NLGetCodeViewController *VC =  [NLGetCodeViewController  new] ;
    VC.forgetPassword = _forgetPassword ;
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
