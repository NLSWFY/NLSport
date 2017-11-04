//
//  NLSegmentView.m
//  Pods
//
//  Created by fanyi on 2017/3/27.
//
//

#import "NLSegmentView.h"
#import "Masonry.h"

@interface NLSegmentButtonView : UIControl

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *imageView;

@property (nonatomic, assign) NLSegmentViewStyle style;

@end

@implementation NLSegmentButtonView : UIControl

- (instancetype)initWithStyle:(NLSegmentViewStyle)style {
    self = [super init];
    if(self) {
        _style = style;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.imageView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.center.mas_equalTo(self);
        make.left.mas_greaterThanOrEqualTo(self).offset(2);
        make.right.mas_lessThanOrEqualTo(self).offset(-2);
    }];
    switch (_style) {
        case NLSegmentViewStyle_Down:
        {
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.contentView).offset(5);
                make.centerX.mas_equalTo(self.contentView);
            }];
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(self.contentView).offset(-5);
                make.top.mas_equalTo(self.imageView.mas_bottom);
            }];
            break;
        }
        case NLSegmentViewStyle_Up:
        {
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.contentView).offset(5);
                make.centerX.mas_equalTo(self.contentView);
            }];
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(self.contentView).offset(-5);
                make.top.mas_equalTo(self.label.mas_bottom).offset(5);
            }];
            break;
        }
        case NLSegmentViewStyle_Left:
        {
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.right.mas_equalTo(self.contentView);
                make.left.mas_equalTo(self.label.mas_right).offset(5);
            }];
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_greaterThanOrEqualTo(self.contentView).offset(2);
                make.top.bottom.mas_equalTo(self.contentView);
                make.centerY.mas_equalTo(self.contentView);
            }];
            break;
        }
        default:
        {
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.right.mas_equalTo(self.contentView);
                make.left.mas_equalTo(self.imageView.mas_right).offset(5);
            }];
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_greaterThanOrEqualTo(self.contentView).offset(2);
                make.top.bottom.mas_equalTo(self.contentView);
                make.centerY.mas_equalTo(self.contentView);
            }];
            break;
        }
    }
}
#pragma mark - getter
- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.userInteractionEnabled = NO;
    }
    return _contentView;
}

- (UILabel *)label {
    if(!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
        [_imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_imageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _imageView;
}

@end

#pragma mark - NLSegmentView
@interface NLSegmentView ()

@property (nonatomic, strong) NSMutableArray <UIView *>* subViewArray;
@property (nonatomic, strong) UIView *selectedLine;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) BOOL needBorder;

@property (assign, nonatomic) BOOL hasAmountColor;//是否支持渐变色
@property (strong, nonatomic) NSArray *colorArray;
@property (strong, nonatomic) CAGradientLayer *colorLayer;

@property (nonatomic, strong) NSDictionary *titleAttributes;
@property (nonatomic, strong) NSDictionary *selectedTitleAttributes;
@property (nonatomic, strong) NSArray <NSString *> *titleArray;
@property (nonatomic, strong) NSArray <NSString *> *imageArray;
@property (nonatomic, strong) NSArray <NSString *> *selectedImageArray;

@property (nonatomic, assign) NLSegmentViewStyle style;
@property (nonatomic, assign) BOOL needInsetLine;
@end

@implementation NLSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _selectedIndex = 0;
        _hasAmountColor = NO;
        _style = NLSegmentViewStyle_Default;
    }
    return self;
}

- (instancetype)initWithTitleArray:(NSArray <NSString *>*)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray {
    
    return [self initWithTitleArray:titleArray titleAttributes:nil selectedTitleAttributes:nil imageArray:imageArray selectedImageArray:selectedImageArray needBorder:YES viewStyle:NLSegmentViewStyle_Default];
}

- (instancetype)initWithTitleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray needBorder:(BOOL)needBorder {
    return [self initWithTitleArray:titleArray titleAttributes:nil selectedTitleAttributes:nil imageArray:imageArray selectedImageArray:selectedImageArray needBorder:needBorder viewStyle:NLSegmentViewStyle_Default];
}

- (instancetype)initWithTitleArray:(NSArray <NSString *> *)titleArray
                   titleAttributes:(NSDictionary * _Nullable)titleAttributes
           selectedTitleAttributes:(NSDictionary * _Nullable)selectedTitleAttributes
                        imageArray:(NSArray <NSString *> *)imageArray
                selectedImageArray:(NSArray <NSString *> *)selectedImageArray
                        needBorder:(BOOL)needBorder
                         viewStyle:(NLSegmentViewStyle)style {
    self = [super init];
    if(self) {
        _style = style;
        _titleArray = titleArray;
        _titleAttributes = titleAttributes;
        _selectedTitleAttributes = selectedTitleAttributes;
        _imageArray = imageArray;
        _selectedImageArray = selectedImageArray;
        _selectedIndex = 0;
        _needBorder = needBorder;
        _hasAmountColor = NO;
        [self setupSubViews];
    }
    return self;
}

- (void)updateTitleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *> *)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray {
    
    BOOL shouldResetSelectedIndex = [_titleArray count] != [titleArray count];
    self.titleArray = titleArray;
    self.imageArray = imageArray;
    self.selectedImageArray = selectedImageArray;

    [self setupSubViews];
    if(shouldResetSelectedIndex) {
        [self setSelectedIndex:0];
    }
}

- (void)setupSubViews {
    self.backgroundColor = [UIColor whiteColor];
    NSUInteger titleCount = _titleArray.count;
    NSUInteger imageCount = _imageArray.count;
    NSUInteger selectedImageCount = _selectedImageArray.count;
    if(imageCount != selectedImageCount && (imageCount +selectedImageCount) != 0) {
        NSAssert(0, @"the count of image and selectedImage can not be different");
    }
    if(titleCount == 0 && imageCount == 0 && selectedImageCount == 0) {
        NSAssert(0, @"the count of title or image can not be 0 the same time");
    }
    else if(imageCount > 0 && titleCount > 0 && titleCount != imageCount) {
        NSAssert(0, @"the count of title and image can not be different");
    }
    else {
        [self.subViewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [self.subViewArray removeAllObjects];
        
        NSInteger btnCount = (titleCount + imageCount )/(!!titleCount + !!imageCount);
        UIView *lastView = nil;
        for (NSInteger i = 0; i < btnCount; i++) {
            NSString *title = titleCount > 0 ?[self.titleArray objectAtIndex:i]:@"";
            NSString *imagString = imageCount > 0 ?[self.imageArray objectAtIndex:i]:@"";
            CGFloat widthScale = 1.0/btnCount;
            UIView *view = [self viewWithTitle:title imageString:imagString needBorder:_needBorder];
            [self.subViewArray addObject:view];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self);
                make.bottom.mas_equalTo(self).offset(-2);
                make.width.mas_equalTo(self).multipliedBy(widthScale);
                if(lastView) {
                    make.left.mas_equalTo(lastView.mas_right);
                }
                else {
                    make.left.mas_equalTo(self.mas_left);
                }
            }];
            lastView = view;
        }
    }
    [self updateView:_selectedIndex selection:YES];
}

- (UIView *)viewWithTitle:(NSString *)title imageString:(NSString *)imageString needBorder:(BOOL)border {
    NLSegmentButtonView *btn = [[NLSegmentButtonView alloc] initWithStyle:self.style];
    if (title.length > 0) {
        btn.label.text = title;
        btn.label.textColor = [self normalColor];
        btn.label.font = [self normalFont];
    }
    if (imageString.length > 0) {
        [btn.imageView setImage:[UIImage imageNamed:imageString]];
    }
    if(border) {
        self.selectedLine.hidden = NO;
    }
    else {
        self.selectedLine.hidden = YES;
    }
    [btn addTarget:self action:@selector(subViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)subViewClicked:(UIView *)sender {
    NSInteger index = [self.subViewArray indexOfObject:sender];
    BOOL shouldChangedIndex = YES;
    //用户点击之后，先判断是否可以跳转
    if(self.beforSegmentViewClickBlock) {
        shouldChangedIndex = self.beforSegmentViewClickBlock(_selectedIndex, index, YES);
    }
    if(shouldChangedIndex) {
        [self setSelectedIndex:index];
    }
}

//用户手动点击，设置选中的index，调回调
- (void)setSelectedIndex:(NSInteger)index {
    if(index >= self.subViewArray.count || index < 0) {
        return;
    }
    if(_selectedIndex == index) {
        return ;
    }
    else {
        [self updateView:_selectedIndex selection:NO];
        [self updateView:index selection:YES];
        _selectedIndex = index;
        if(self.segmentViewBlock) {
            self.segmentViewBlock(index, YES);
        }
    }
}

//更新选中的index,不调用回调
- (void)updateSelectedIndex:(NSInteger)index {
    if(index >= self.subViewArray.count || index < 0) {
        return;
    }
    if(_selectedIndex == index) {
        return ;
    }
    else {
        [self updateView:_selectedIndex selection:NO];
        [self updateView:index selection:YES];
        _selectedIndex = index;
    }
}

- (void)setAmountColor:(NSArray *)colorArrays {
    self.colorArray = colorArrays;
    if(colorArrays.count > 0) {
        self.hasAmountColor = YES;
    }
    else {
        self.hasAmountColor = NO;
        return;
    }
    CGRect rect =  self.bounds;

    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CAGradientLayer *graydientLayer = [CAGradientLayer layer];
    graydientLayer.frame = CGRectMake(0, 0, width, height);
    
    graydientLayer.colors = self.colorArray;
    graydientLayer.startPoint = CGPointMake(0, 0);
    graydientLayer.endPoint = CGPointMake(0, 1);

    self.colorLayer = graydientLayer;
    [self.layer insertSublayer:graydientLayer atIndex:0];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if(self.hasAmountColor) {
        CGRect rect =  self.bounds;

        CGFloat width = rect.size.width;
        CGFloat height = rect.size.height;
        
        CAGradientLayer *graydientLayer = [CAGradientLayer layer];
        graydientLayer.frame = CGRectMake(0, 0, width, height);

        graydientLayer.colors = self.colorArray;

        graydientLayer.startPoint = CGPointMake(0, 0);
        graydientLayer.endPoint = CGPointMake(0, 1);
        
        if(self.colorLayer) {
            [self.layer replaceSublayer:self.colorLayer with:graydientLayer];
        }
        self.colorLayer = graydientLayer;
    }
}

#pragma mark - set
- (void)setTitleArray:(NSArray<NSString *> *)titleArray {
    _titleArray = titleArray;
}

- (void)setImageArray:(NSArray<NSString *> *)imageArray {
    _imageArray = imageArray;
}

- (void)setSelectedImageArray:(NSArray<NSString *> *)selectedImageArray {
    _selectedImageArray = selectedImageArray;
}

- (void)updateView:(NSInteger)index selection:(BOOL)selected {
    if(index < 0 || index >= self.subViewArray.count) {
        return ;
    }
    BOOL hasImage = self.selectedImageArray.count > 0;
    NLSegmentButtonView *btn = (NLSegmentButtonView *)[self.subViewArray objectAtIndex:index];
    if(selected) {
        btn.label.textColor = [self selectedColor];
        btn.label.font = [self selectedFont];
        if(hasImage) {
            btn.imageView.image = [UIImage imageNamed:[self.selectedImageArray objectAtIndex:index]];
        }
        else {
            btn.imageView.image = nil;
        }
    }
    else {
        btn.label.textColor = [self normalColor];
        btn.label.font = [self normalFont];
        if(hasImage) {
            btn.imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
        }
        else {
            btn.imageView.image = nil;
        }
    }
    
    [self.selectedLine removeFromSuperview];
    [self addSubview:self.selectedLine];
    [self.selectedLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(btn.mas_left).offset(6);
        make.right.mas_equalTo(btn.mas_right).offset(-6);
        make.top.mas_equalTo(btn.mas_bottom);
    }];
}

#pragma mark - get
- (UIColor *)normalColor {
    UIColor *normalColor = self.titleAttributes[NSForegroundColorAttributeName];
    return !!normalColor ? normalColor : [UIColor blackColor];
}

- (UIColor *)selectedColor {
    UIColor *selectedColor = self.selectedTitleAttributes[NSForegroundColorAttributeName];
    return !!selectedColor ? selectedColor : [UIColor redColor];
}

- (UIFont *)normalFont {
    UIFont *normalFont = self.titleAttributes[NSFontAttributeName];
    return !!normalFont ? normalFont : [UIFont systemFontOfSize:14];
}

- (UIFont *)selectedFont {
    UIFont *selectedFont = self.selectedTitleAttributes[NSFontAttributeName];
    return !!selectedFont ? selectedFont : [UIFont systemFontOfSize:14];
}

- (NSMutableArray <UIView *>*)subViewArray {
    if(!_subViewArray) {
        _subViewArray = [NSMutableArray array];
    }
    return _subViewArray;
}

- (UIView *)selectedLine {
    if(!_selectedLine) {
        _selectedLine = [UIView new];
        _selectedLine.backgroundColor = [UIColor nl_colorWithHexString:@"#F14C30"];
    }
    return _selectedLine;
}
@end
