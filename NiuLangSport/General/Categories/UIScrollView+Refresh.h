//
//  UIScrollView+Refresh.h
//  collectionTest
//
//  Created by fanyi on 2017/5/17.
//  Copyright © 2017年 fanyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

#pragma mark - pull to refresh

//下拉动作且释放之后，会调用block handler,所以需要在block中加上拿到数据设置刷新状态的代码
- (void)nl_setPullToRefreshHandler:(void(^ _Nonnull)(void))handler;

//调用该方法，让页面进入刷新动作，不是用户手动触发的动作，一般用于首次进入页面，自动刷新时使用
- (void)nl_pullToRefresh;

//通知当前已经刷新完毕
- (void)nl_refreshFinished;

#pragma mark - pull to load more

//上拉动作且释放之后，会调用block handler
- (void)nl_setPullToLoadMoreHandler:(void(^ _Nonnull)(void))handler;

//调用该方法，让页面进入加载更多动作
- (void)nl_setPullToLoadMore;

//通知当前已经加上拉载完毕
- (void)nl_loadMoreFinished;

//通知当前已经加上拉载完毕,且没有更多数据了
- (void)nl_loadMoreFinishedWithNoMoreData;

//重置上拉加载更多view
- (void)nl_resetNoMoreData;

@end
