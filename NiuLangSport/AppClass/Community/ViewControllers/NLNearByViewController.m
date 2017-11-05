//
//  NLNearByViewController.m
//  NiuLangSport
//
//  Created by 凡义 on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLNearByViewController.h"
#import "FITArticleTableViewCell.h"
#import "Masonry.h"

@interface NLNearByViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NLNearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor nl_colorWithHexString:@"#f6f6f6"];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    label.text = @"附近动态";
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        [_tableView registerClass:[FITArticleTableViewCell class] forCellReuseIdentifier:@"FITArticleTableViewCell"];
    }
    return _tableView;
}

@end
