//
//  NLBaseViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/1.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLBaseViewController.h"


@interface NLBaseViewController ()

@end

@implementation NLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.view.backgroundColor = BaseColor ;
    
    //设置状态栏
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    self.automaticallyAdjustsScrollViewInsets = NO ;
   [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
   [self setupForDismissKeyboard];
    // Do any additional setup after loading the view.
}
//- (void)setupForDismissKeyboard
//{
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    UITapGestureRecognizer *singleTapGR =
//    [[UITapGestureRecognizer alloc] initWithTarget:self
//                                            action:@selector(tapAnywhereToDismissKeyboard:)];
//    
//    __weak UIViewController *weakSelf = self;
//    
//    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
//    [nc addObserverForName:UIKeyboardWillShowNotification
//                    object:nil
//                     queue:mainQuene
//                usingBlock:^(NSNotification *note){
//                    [weakSelf.view addGestureRecognizer:singleTapGR];
//                }];
//    [nc addObserverForName:UIKeyboardWillHideNotification
//                    object:nil
//                     queue:mainQuene
//                usingBlock:^(NSNotification *note){
//                    [weakSelf.view removeGestureRecognizer:singleTapGR];
//                }];
//}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

- (void)setupForDismissKeyboard
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    
                  @weakify(self);
                 [[nc rac_addObserverForName:UIKeyboardWillShowNotification  object:nil ]subscribeNext:^(NSNotification * _Nullable x) {
                     @strongify(self);
                           [self.view addGestureRecognizer:singleTapGR];
               }];
    
            [[nc rac_addObserverForName:UIKeyboardWillHideNotification object:nil ]subscribeNext:^(NSNotification * _Nullable x) {
                @strongify(self);
                [self.view removeGestureRecognizer:singleTapGR];
            }];
    
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
