//
//  UIScrollView+Refresh.m
//  collectionTest
//
//  Created by fanyi on 2017/5/17.
//  Copyright © 2017年 fanyi. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import "MJRefresh.h"

@implementation UIScrollView (Refresh)

#pragma mark - pull to refresh

//下拉动作且释放之后，会调用block handler
- (void)nl_setPullToRefreshHandler:(void(^ _Nonnull)(void))handler {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:handler];
//    self.mj_header.
}

//调用该方法，让页面进入刷新动作，不是用户手动触发的动作，一般用于首次进入页面，自动刷新时使用
- (void)nl_pullToRefresh {
    [self.mj_header beginRefreshing];
}

//通知当前已经刷新完毕
- (void)nl_refreshFinished {
    [self.mj_header endRefreshing];
}

#pragma mark - pull to load more

//上拉动作且释放之后，会调用block handler
- (void)nl_setPullToLoadMoreHandler:(void(^ _Nonnull)(void))handler {
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:handler];
}

//调用该方法，让页面进入加载更多动作
- (void)nl_setPullToLoadMore {
    [self.mj_footer beginRefreshing];
}

//通知当前已经加上拉载完毕
- (void)nl_loadMoreFinished {
    [self.mj_footer endRefreshing];
}

- (void)nl_loadMoreFinishedWithNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)nl_resetNoMoreData {
    [self.mj_footer resetNoMoreData];
}
@end
