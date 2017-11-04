//
//  QFBannerFocusView.m
//  BJPubMed
//
//  Created by Qingfeng on 16/1/29.
//  Copyright © 2016年 BJHL. All rights reserved.
//

#import "QFBannerFocusView.h"
#import "SDWebImage/SDWebImageManager.h"
#import "SDWebImage/UIImageView+WebCache.h"

static const NSTimeInterval QFBannerFocusViewAutoScrollTimeIntervalDefault = 4;
static const CGFloat        QFBannerFocusViewPageControlWidth   = 120;
static const CGFloat        QFBannerFocusViewPageControlHeight  = 30;
static const CGFloat        QFBannerFocusViewRightMargin        = 10;
static const NSInteger      QFBannerFocusViewImageViewTagOffset = 80000;

@interface QFBannerFocusView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView   *scrollView;
@property (nonatomic, strong) NSArray        *focusItems;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) SMPageControl  *pageControl;

@end

@implementation QFBannerFocusView

#pragma mark - Life Cycle

- (void)dealloc {
    [self pauseAutoScroll];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageViews = [NSMutableArray array];
        _autoScrollEnabled = NO;
        _autoScrollTimeInterval = QFBannerFocusViewAutoScrollTimeIntervalDefault;
        self.clipsToBounds = YES;
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

#pragma mark - Manage Subviews

- (UIScrollView *)scrollView {
    if (_scrollView) {
        return _scrollView;
    }
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollsToTop = NO;
    _scrollView.clipsToBounds = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    return _scrollView;
}

- (SMPageControl *)pageControl {
    if (_pageControl) {
        return _pageControl;
    }
    
    CGRect frame = CGRectMake(CGRectGetWidth(self.bounds) - QFBannerFocusViewPageControlWidth,
                              CGRectGetHeight(self.bounds) - QFBannerFocusViewPageControlHeight,
                              QFBannerFocusViewPageControlWidth,
                              QFBannerFocusViewPageControlHeight);
    _pageControl = [[SMPageControl alloc] initWithFrame:frame];
    _pageControl.hidesForSinglePage = YES;
    _pageControl.userInteractionEnabled = YES;
    _pageControl.currentPage = 0;
    _pageControl.indicatorMargin = 3;
    _pageControl.indicatorDiameter = 4;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_pageControl addTarget:self
                     action:@selector(didTapOnPageControl:)
           forControlEvents:UIControlEventValueChanged];
    
    return _pageControl;
}

- (UIImageView *)addImageViewWithFrame:(CGRect)frame index:(NSUInteger)index {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.userInteractionEnabled = YES;
    imageView.tag = QFBannerFocusViewImageViewTagOffset + index;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(tapImageViewWithGestureRecognizer:)];
    [imageView addGestureRecognizer:tapGestureRecognizer];
    [self.imageViews addObject:imageView];
    [self.scrollView addSubview:imageView];
    return imageView;
}

- (void)addImageViewWithFrame:(CGRect)frame
                        index:(NSUInteger)index
          additionalImageView:(UIImageView *)additionalImageView {
    UIImageView *imageView = [self addImageViewWithFrame:frame index:index];
    
    NSString *imageUrl = nil;
    if (index < self.focusItems.count) {
        imageUrl = [self.focusItems objectAtIndex:index];
    }
    
    __weak __typeof(imageView) weakImageView = imageView;
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                 placeholderImage:[UIImage imageNamed:@"launch"]
                          options:index < 3 ? SDWebImageRetryFailed : (SDWebImageRetryFailed | SDWebImageLowPriority)
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            __strong __typeof(weakImageView) imageView = weakImageView;
                            additionalImageView.image = imageView.image;
                            if (imageView && image && cacheType == SDImageCacheTypeNone) {
                                CATransition *transition = [CATransition animation];
                                transition.type = kCATransitionFade;
                                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                                transition.duration = [CATransaction animationDuration];
                                [imageView.layer addAnimation:transition forKey:nil];
                            }
                        }];
}

- (void)updateImageViews {
    for (UIImageView *imageView in self.imageViews) {
        [imageView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    
    for (NSUInteger index = 0; index < [self.focusItems count]; ++index) {
        CGRect rtFrame = CGRectZero;
        
        UIImageView *additionalImageView = nil;
        if (index == 0) {
            rtFrame = CGRectMake(CGRectGetWidth(self.bounds) * (self.focusItems.count + 1),
                                 0,
                                 CGRectGetWidth(self.bounds),
                                 CGRectGetHeight(self.scrollView.bounds));
            additionalImageView = [self addImageViewWithFrame:rtFrame index:index];
        }
        else if (index == self.focusItems.count - 1) {
            rtFrame = CGRectMake(0,
                                 0,
                                 CGRectGetWidth(self.bounds),
                                 CGRectGetHeight(self.scrollView.bounds));
            additionalImageView = [self addImageViewWithFrame:rtFrame index:index];
        }
        
        rtFrame = CGRectMake(CGRectGetWidth(self.bounds) * (index + 1),
                             0,
                             CGRectGetWidth(self.bounds),
                             CGRectGetHeight(self.scrollView.bounds));
        [self addImageViewWithFrame:rtFrame index:index additionalImageView:additionalImageView];
    }
}

- (void)updatePageControl {
    self.pageControl.numberOfPages = self.focusItems.count;
    CGSize size = [self.pageControl sizeForNumberOfPages:self.pageControl.numberOfPages];
    CGRect rect = self.pageControl.frame;
    rect.size.width = size.width;
    rect.origin.x = CGRectGetWidth(self.bounds) - size.width - QFBannerFocusViewRightMargin;
    self.pageControl.frame = rect;
    self.pageControl.currentPage = 0;
}

/**
 * @param index index refer to the page index
 */
- (void)showImageAtIndex:(NSInteger)index animated:(BOOL)animated {
    if (!(index < self.pageControl.numberOfPages)) {
        index = 0;
    }
    if (animated) {
        self.scrollView.userInteractionEnabled = NO;
    }
    
    CGRect bounds = self.scrollView.bounds;
    [self.scrollView scrollRectToVisible:CGRectMake(CGRectGetWidth(bounds) * (index + 1),
                                                    0,
                                                    bounds.size.width,
                                                    bounds.size.height)
                                animated:animated];
    [self didShowImageAtIndex:index];
}

/**
 * @param index index refer to the page index
 */
- (void)didShowImageAtIndex:(NSInteger)index {
    !self.shownCallback ?: self.shownCallback(self, index);
    self.pageControl.currentPage = index;
}

- (void)updateWithFocusItems:(NSArray<NSString *> * _Nullable)focusItems {
    self.focusItems = focusItems;
    
    NSUInteger pageCount = self.focusItems.count;
    self.scrollView.scrollEnabled = pageCount > 1;
    
    [self.scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.scrollView.bounds) * (pageCount + 2), CGRectGetHeight(self.scrollView.bounds))];
    [self updatePageControl];
    [self updateImageViews];
    [self showImageAtIndex:0 animated:NO];
    if (self.scrollView.scrollEnabled && self.autoScrollEnabled) {
        [self resumeAutoScroll];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self pauseAutoScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self resumeAutoScroll];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = fabs(self.scrollView.contentOffset.x) / CGRectGetWidth(self.scrollView.bounds) - 1;
    if(currentPage < 0) {
        [self showImageAtIndex:self.pageControl.numberOfPages - 1 animated:NO];
    }
    else if(currentPage >= self.pageControl.numberOfPages) {
        [self showImageAtIndex:0 animated:NO];
    }
    else {
        [self didShowImageAtIndex:currentPage];
    }
    
    [self resumeAutoScroll];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.scrollView.userInteractionEnabled = YES;
}

#pragma mark - Event Response

- (void)didTapOnPageControl:(SMPageControl *)pageControl {
    [self showImageAtIndex:self.pageControl.currentPage animated:YES];
}

- (void)tapImageViewWithGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
    !self.selectionCallback ?: self.selectionCallback(self, tapGestureRecognizer.view.tag - QFBannerFocusViewImageViewTagOffset);
}

#pragma mark - Auto Scrolling

- (void)resumeAutoScroll {
    [self pauseAutoScroll];
    
    if (self.focusItems.count <= 1) {
        return;
    }
    
    if (self.autoScrollEnabled) {
        if (self.autoScrollTimeInterval <= 0) {
            self.autoScrollTimeInterval = QFBannerFocusViewAutoScrollTimeIntervalDefault;
        }
        [self performSelector:@selector(scrollToNextPage)
                   withObject:nil
                   afterDelay:self.autoScrollTimeInterval];
    }
}

- (void)pauseAutoScroll {
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(scrollToNextPage)
                                               object:nil];
}

- (void)setAutoScrollEnabled:(BOOL)autoScrollEnabled {
    _autoScrollEnabled = autoScrollEnabled;
    
    if (autoScrollEnabled) {
        [self resumeAutoScroll];
    }
    else {
        [self pauseAutoScroll];
    }
}

- (void)scrollToNextPage {
    NSInteger focusItemsCount = self.focusItems.count;
    if (self.scrollView.dragging || focusItemsCount <= 1) {
        return;
    }
    
    NSInteger currentPage = fabs(self.scrollView.contentOffset.x) / CGRectGetWidth(self.scrollView.bounds);
    if (currentPage >= focusItemsCount) {
        currentPage = 0;
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    }
    
    [self showImageAtIndex:currentPage animated:YES];
    
    if (self.autoScrollEnabled) {
        if (self.autoScrollTimeInterval <= 0) {
            self.autoScrollTimeInterval = QFBannerFocusViewAutoScrollTimeIntervalDefault;
        }
        [self performSelector:@selector(scrollToNextPage)
                   withObject:nil
                   afterDelay:self.autoScrollTimeInterval];
    }
}

@end
