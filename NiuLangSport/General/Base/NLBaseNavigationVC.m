//
//  NLBaseNavigationVC.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/1.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLBaseNavigationVC.h"
#import "UIBarButtonItem+Extension.h"

@interface NLBaseNavigationVC ()

@end

@implementation NLBaseNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarUI];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark--设置字体和背景色
-(void)setNavBarUI{
    self.navigationBar.barTintColor = NavColor ;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault ;
    self.navigationController.navigationBar.translucent = YES;
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName: NavTextColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0f]}];
    
    
}
//重写push方法，统一设置导航栏左右按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if(self.childViewControllers.count > 0)
    {
        //icon_leftArrow
        viewController.hidesBottomBarWhenPushed = YES ;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem  customitemWithTarget:self action:@selector(back) image:@"icon_arrow_nav" highImage:@"icon_leftArrow" withTitle:@"   " withSize:CGSizeMake(40, 30)];
        viewController.automaticallyAdjustsScrollViewInsets = NO;
    }
    [super pushViewController:viewController animated:animated];
    
}
-(void)back
{
    [self popViewControllerAnimated:YES];
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
