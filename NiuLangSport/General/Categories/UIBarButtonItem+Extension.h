//
//  UIBarButtonItem+Extension.h
//  

//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (UIBarButtonItem *)customitemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage withTitle:(NSString *)title withSize:(CGSize)mysize;
@end
