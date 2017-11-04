//
//  NLRecommendViewController.m
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLRecommendViewController.h"
#import "QFBannerFocusView.h"
#import "NLBannerImageModel.h"
#import "Masonry.h"
#import "FITArticleTableViewCell.h"

@interface NLRecommendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) QFBannerFocusView *headerView;

@end

@implementation NLRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.offset(0);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        }];
    } else {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
    }
    
    NLBannerImageModel *model1 = [NLBannerImageModel new];
    model1.imageUrl = @"http://f.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81edd12d22b53eb13532fa4011.jpg";
    NLBannerImageModel *model2 = [NLBannerImageModel new];
    model2.imageUrl = @"http://f.hiphotos.baidu.com/image/pic/item/b64543a98226cffce32b73c7b3014a90f603ea47.jpg";

    [self.headerView updateWithFocusItems:@[model1.imageUrl, model2.imageUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.headerView.autoScrollEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.headerView.autoScrollEnabled = NO;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FITArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FITArticleTableViewCell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FITArticleTableViewCell" owner:self options:nil]lastObject];
        
    }
//    if([_dataArray[indexPath.section] count] - 1 == indexPath.row){
//        cell.lineView.hidden = YES;
//    }else{
//        cell.lineView.hidden = NO;
//    }
//    
//    [cell configUI:_dataArray[indexPath.section][indexPath.row]];
    return cell ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"精选推荐";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(14);
        make.right.offset(-14);
        make.top.offset(10);
        make.bottom.offset(-10);
    }];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

#pragma mark - get
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_tableView registerClass:[FITArticleTableViewCell class] forCellReuseIdentifier:@"FITArticleTableViewCell"];
    }
    return _tableView;
}

- (QFBannerFocusView *)headerView {
    if(!_headerView) {
        CGFloat width = SCREEN_W;
        CGFloat height = 180 * 375 / SCREEN_W;
        CGRect frame = CGRectMake(0, 0, width, height);

        _headerView = [[QFBannerFocusView alloc] initWithFrame:frame];
        _headerView.pageControl.indicatorDiameter = 6;
        
        @weakify(self);
        _headerView.selectionCallback = ^(QFBannerFocusView * _Nonnull bannerFocusView, NSInteger index) {
            @strongify(self);
            NLBannerImageModel *model1 = [NLBannerImageModel new];
            model1.imageUrl = @"http://f.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81edd12d22b53eb13532fa4011.jpg";
            NLBannerImageModel *model2 = [NLBannerImageModel new];
            model2.imageUrl = @"http://f.hiphotos.baidu.com/image/pic/item/b64543a98226cffce32b73c7b3014a90f603ea47.jpg";
        };
        _headerView.backgroundColor = [UIColor yellowColor];
    }
    return _headerView;
}

@end
