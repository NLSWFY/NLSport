//
//  NLSegmentView.m.h
//  Pods
//
//  Created by fanyi on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

//文字和图片摆放位置的样式
typedef NS_ENUM(NSInteger, NLSegmentViewStyle) {
    NLSegmentViewStyle_Default = 0, //图左文字右
    NLSegmentViewStyle_Down ,      //图上文字下
    NLSegmentViewStyle_Up ,        //图下文字上
    NLSegmentViewStyle_Left ,   //图右文字左
};

/*
 * 分段选择器 提供自定义title和icon，同时存在title和icon时 ，两者数量必须保持一致
 * 支持全文字，或者全图片，也支持既有title也有icon
 * 可以作为单选控件（多个按钮中只能选择一个）
 */

@interface NLSegmentView : UIView

//selectedIndex更新之后会触发的回调
@property (nonatomic, copy) void(^segmentViewBlock)(NSInteger index, BOOL selected);

//selectedIndex更新之前判断是否要更新selectedIndex
@property (nonatomic, copy) BOOL(^beforSegmentViewClickBlock)(NSInteger lastIndex, NSInteger index, BOOL selected);

@property (nonatomic, assign) NSInteger selectedIndex;


//设置title，图片，默认是带下划指示线
- (instancetype)initWithTitleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray;

//设置title，图片，以及是否需要下划指示线
- (instancetype)initWithTitleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray needBorder:(BOOL)needBorder;

//设置title，title样式，图片，以及是否需要下划指示线
- (instancetype)initWithTitleArray:(NSArray <NSString *> *)titleArray
                   titleAttributes:(NSDictionary * _Nullable)titleAttributes
           selectedTitleAttributes:(NSDictionary * _Nullable)selectedTitleAttributes
                        imageArray:(NSArray <NSString *> *)imageArray
                selectedImageArray:(NSArray <NSString *> *)selectedImageArray
                        needBorder:(BOOL)needBorder
                         viewStyle:(NLSegmentViewStyle)style;

//更新title, 更新图片
- (void)updateTitleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray;

//更新选中index，但不会触发segmentViewBlock回调
- (void)updateSelectedIndex:(NSInteger)index ;

//设置渐变色
- (void)setAmountColor:(NSArray<UIColor *> *)colorArrays;
@end
