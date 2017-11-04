//
//  NLCommunityViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/2.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLCommunityViewController.h"
#import "NLRecommendViewController.h"
#import "NLNearByViewController.h"
#import "NLFocusViewController.h"
#import "UIViewController+Ext.h"
#import "NLSegmentView.h"
#import "Masonry.h"

@interface NLCommunityViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) NLSegmentView *segmentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NLRecommendViewController *recommendVC;
@property (nonatomic, strong) NLFocusViewController  *focusVC;
@property (nonatomic, strong) NLNearByViewController *nearByVC;
@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation NLCommunityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTopView];
    
//    NLRecommendViewController *vc = [[NLRecommendViewController alloc] init];
//    [self ext_addChildViewController:vc];
//    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.offset(0);
//        make.bottom.offset(-49);
//        make.top.mas_equalTo(self.topView.mas_bottom);
//    }];
    [self updateView];
    _selectIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - private
- (void)setTopView {
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(64);
    }];
    [self.topView nl_addBottomBorderWithHeight:ONEPX andColor:[UIColor nl_colorWithHexString:@"#CCCCCC"]];
    
    UIButton *rightBtn = [UIButton new];
    [rightBtn setBackgroundColor:[UIColor blackColor]];
    [rightBtn addTarget:self action:@selector(actionSheet:clickedButtonAtIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-18);
        make.bottom.offset(-14);
        make.height.width.mas_equalTo(15);
    }];
    
    [self.topView addSubview:self.segmentView];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-ONEPX);
        make.width.mas_equalTo(220);
        make.height.mas_equalTo(33);
    }];
}

- (void)updateView {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.offset(-49);
        make.top.mas_equalTo(self.topView.mas_bottom);
    }];
    
    NSInteger num = [[self pages] count];

    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.height.mas_equalTo(self.scrollView.mas_height);
        make.width.mas_equalTo(self.scrollView.mas_width).multipliedBy(num);
    }];
    
    UIViewController *pre;
    for (NSInteger i = 0; i < num; i ++) {
        UIViewController *vc = [[self pages] objectAtIndex:i];
        [self addChildViewController:vc];
        [self.contentView addSubview:vc.view];

        if(i == 0 ) {
            [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.offset(0);
                make.width.mas_equalTo(self.scrollView.mas_width);
            }];
        }
        else if(i == num -1) {
            [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(pre.view.mas_right).offset(0);
                make.top.bottom.right.offset(0);
                make.width.mas_equalTo(self.scrollView.mas_width);
            }];
        }
        else {
            [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(pre.view.mas_right).offset(0);
                make.top.bottom.offset(0);
                make.width.mas_equalTo(self.scrollView.mas_width);
            }];
        }
        pre = vc;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = (int)scrollView.contentOffset.x/_scrollView.frame.size.width;
    if(_selectIndex != index) {
        [self.segmentView setSelectedIndex:index];
    }
}

#pragma mark - get
- (UIView *)topView {
    if(!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

- (NLSegmentView *)segmentView {
    if(!_segmentView) {
        _segmentView = [[NLSegmentView alloc] initWithTitleArray:@[@"推荐", @"关注", @"附近"] titleAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:17.0]} selectedTitleAttributes:@{NSForegroundColorAttributeName:[UIColor nl_colorWithHexString:@"#F14C30"], NSFontAttributeName:[UIFont systemFontOfSize:17.0]} imageArray:nil selectedImageArray:nil needBorder:YES viewStyle:NLSegmentViewStyle_Up];
       
        @weakify(self);
        _segmentView.segmentViewBlock = ^(NSInteger index, BOOL selected) {
            @strongify(self);
            NSInteger num = [[self pages] count];
            if(index < 0 || index >= num) {
                return ;
            }
            _selectIndex = index;
            CGRect rect = CGRectMake(index * self.scrollView.width, 0, self.scrollView.width, self.scrollView.height);
            [self.scrollView scrollRectToVisible:rect animated:NO];
        };
    }
    return _segmentView;
}

- (UIScrollView *)scrollView {
    if(!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _scrollView.scrollsToTop = NO;
    }
    return _scrollView;
}

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor blackColor];
    }
    return _contentView;
}

- (NSArray <UIViewController *>*)pages {
    return @[self.recommendVC, self.focusVC, self.nearByVC];
}

- (NLRecommendViewController *)recommendVC {
    if(!_recommendVC) {
        _recommendVC = [[NLRecommendViewController alloc] init];
    }
    return _recommendVC;
}

- (NLNearByViewController *)nearByVC {
    if(!_nearByVC) {
        _nearByVC = [[NLNearByViewController alloc] init];
    }
    return _nearByVC;
}

- (NLFocusViewController *)focusVC {
    if(!_focusVC) {
        _focusVC = [[NLFocusViewController alloc] init];
    }
    return _focusVC;
}

@end
