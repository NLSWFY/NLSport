//
//  QFBannerFocusView.h
//  BJPubMed
//
//  Created by Qingfeng on 16/1/29.
//  Copyright © 2016年 BJHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMPageControl/SMPageControl.h>

//滚动的view
@class QFBannerFocusView;
typedef void (^QFBannerFocusViewCallback) (QFBannerFocusView * _Nonnull bannerFocusView, NSInteger index);

@interface QFBannerFocusView : UIView

@property (nonatomic) BOOL autoScrollEnabled;
@property (nonatomic) NSTimeInterval autoScrollTimeInterval;
@property (nonatomic, strong, readonly, nonnull) SMPageControl *pageControl;
@property (nonatomic, copy, nullable) QFBannerFocusViewCallback shownCallback;
@property (nonatomic, copy, nullable) QFBannerFocusViewCallback selectionCallback;

- (void)updateWithFocusItems:(NSArray<NSString *> * _Nullable)focusItems;

@end
