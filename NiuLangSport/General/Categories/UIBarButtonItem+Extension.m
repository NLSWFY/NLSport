//
//  UIBarButtonItem+Extension.m

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "UIImage+Tint.h"
@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *  
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.adjustsImageWhenHighlighted = NO;
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = CGSizeMake(30, 40);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)customitemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage withTitle:(NSString *)title withSize:(CGSize)mysize{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    if (image) {
       
        [btn setImage: [[UIImage imageNamed:image]imageWithTintColor:TabbarItemTextColor] forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[[UIImage imageNamed:highImage]imageWithTintColor:TabbarItemTextColor] forState:UIControlStateHighlighted];
    }
   
    // 设置尺寸
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
   
    btn.size =mysize;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}
@end
