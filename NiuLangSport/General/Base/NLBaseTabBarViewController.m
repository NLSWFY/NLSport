//
//  NLBaseTabBarViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/1.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLBaseTabBarViewController.h"
#import "NLHomeViewController.h"
#import "NLCommunityViewController.h"
#import "NLFindViewController.h"
#import "NLMineViewController.h"
#import "NLMoreFunctionViewController.h"
#import "NLBaseNavigationVC.h"

@interface NLBaseTabBarViewController ()
{
     NSArray *titleArr,*imgSelectArr,*imgDefaultArr;
    
}

@end

@implementation NLBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self addItems];
    [self changeItemTextColourAndFont];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark--初始化数据
-(void)initData{
    titleArr = @[@"首页",@"社区",@"",@"发现",@"我的" ];
    imgDefaultArr = @[@"首页未点击",@"中介未点击",@"加号",@"发布未点击",@"我的未点击"];
    imgSelectArr = @[@"首页点击",@"中介点击",@"加号",@"发布点击",@"我的点击"];
}
#pragma mark -- 添加子控制器
-(void)addItems{
    
    NLHomeViewController *homeVC = [NLHomeViewController new];
    NLCommunityViewController *communityVC = [NLCommunityViewController new];
    NLMoreFunctionViewController *moreFunctionVC = [NLMoreFunctionViewController new];
    NLFindViewController *findVC = [NLFindViewController new] ;
    NLMineViewController *mineVC = [NLMineViewController new];
    
    
    
    NSMutableArray *VcArr = [NSMutableArray arrayWithObjects:homeVC,communityVC,moreFunctionVC,findVC ,mineVC,nil];
    for (int i = 0; i<VcArr.count; i++) {
        [self addChildVc:VcArr[i] title:titleArr[i] image:imgDefaultArr[i] selectedImage:imgSelectArr[i]];
        
    }
    
}
#pragma mark -- 初始化控制器数据
-(void)addChildVc:(UIViewController*)childVc title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage{
    childVc.title = title;
 
    childVc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if(!childVc.title.length)
    {
        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
    }
    NLBaseNavigationVC *NavVc = [[NLBaseNavigationVC alloc]initWithRootViewController:childVc];
    [self addChildViewController:NavVc];
    
    
}
#pragma mark --调整item的文字颜色和字体大小
-(void)changeItemTextColourAndFont
{
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:TabbarItemTextColor,NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateSelected];
    self.tabBar.barTintColor = TabBarColor ;
    
//      UIView *redView =    [[UIView alloc]initWithFrame:CGRectMake(SCREEN_W/2 - 25, SCREEN_H-50, 50, 50)];
//      redView.backgroundColor =[UIColor greenColor];
//      [self.view addSubview:redView];
    
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
