//
//  NLPublishArticleViewController.m
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/5.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLPublishArticleViewController.h"
#import "UIImage+Tint.h"

@interface NLPublishArticleViewController ()

@end

@implementation NLPublishArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setNavi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavi {
    self.title = @"我要发帖";
    [self nl_setBackWithImage:[UIImage nl_imageWithColor:[UIColor redColor] size:CGSizeMake(15, 15)]];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(publish:)];
    self. navigationItem.rightBarButtonItem = rightItem;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:16], NSForegroundColorAttributeName:[UIColor nl_colorWithHexString:@"#333333"]} forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:16], NSForegroundColorAttributeName:[UIColor nl_colorWithHexString:@"#cccccc"]} forState:UIControlStateDisabled | UIControlStateSelected];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

#pragma mark - private
- (void)publish:(id)sender {
    
}

#pragma mark - get

@end
