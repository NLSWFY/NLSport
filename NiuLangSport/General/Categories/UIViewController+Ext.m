//
//  UIViewController+Ext.m
//  FYapp
//
//  Created by fanyi on 2017/9/14.
//  Copyright © 2017年 fanyi. All rights reserved.
//

#import "UIViewController+Ext.h"
#import "UIImage+Tint.h"

@implementation UIViewController (Ext)

- (void)ext_addChildViewController:(UIViewController *)viewController {
    if(!viewController || !viewController.view) {
        return;
    }
    
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)ext_removeFromParentViewControllerAndSuperview {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

#pragma mark - onback
- (void)nl_setBackWithImage:(UIImage *)backImage {
    UIBarButtonItem *theBarItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(nl_onBack)];
//    theBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);
    if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0) {
        [theBarItem setBackgroundImage:[UIImage nl_imageWithColor:[UIColor clearColor] size:CGSizeMake(20, 40)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    self.navigationItem.leftBarButtonItem = theBarItem;
}

- (void)nl_onBack {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
