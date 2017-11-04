//
//  UIView+IBDesignable.m
//  Pinder
//
//  Created by Anton Bukov on 31.10.15.
//  Copyright (c) 2015 Happy Santa. All rights reserved.
//

#import "UIView+IBDesignable.h"

@implementation UIView (IBDesignable)

- (BOOL)lShouldRasterize {
    return self.layer.shouldRasterize;
}

- (void)setLShouldRasterize:(BOOL)lShouldRasterize {
    self.layer.shouldRasterize = lShouldRasterize;
    if (lShouldRasterize) {
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
}

- (BOOL)lMasksToBounds {
    return self.layer.masksToBounds;
}

- (void)setLMasksToBounds:(BOOL)lMasksToBounds {
    self.layer.masksToBounds = lMasksToBounds;
}

- (CGFloat)lCornerRadius {
    return self.layer.cornerRadius;
}

- (void)setLCornerRadius:(CGFloat)lCornerRadius {
    self.layer.cornerRadius = lCornerRadius;
}

- (UIColor *)lBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLBorderColor:(UIColor *)lBorderColor {
    self.layer.borderColor = lBorderColor.CGColor;
}

- (CGFloat)lBorderWidth {
    return self.layer.borderWidth;
}

- (void)setLBorderWidth:(CGFloat)lBorderWidth {
    self.layer.borderWidth = lBorderWidth;
}

#pragma mark - Shadow

- (UIColor *)lShadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setLShadowColor:(UIColor *)lShadowColor {
    self.layer.shadowColor = lShadowColor.CGColor;
}

- (CGFloat)lShadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setLShadowOpacity:(CGFloat)lShadowOpacity {
    self.layer.shadowOpacity = lShadowOpacity;
}

- (CGFloat)lShadowRadius {
    return self.layer.shadowRadius;
}

- (void)setLShadowRadius:(CGFloat)lShadowRadius {
    self.layer.shadowRadius = lShadowRadius;
}

- (CGSize)lShadowOffset {
    return self.layer.shadowOffset;
}

- (void)setLShadowOffset:(CGSize)lShadowOffset {
    self.layer.shadowOffset = lShadowOffset;
}

@end

//

@implementation UILabel (IBDesignable)

- (CGFloat)paragraphLineHeight {
    NSParagraphStyle *paragraph = [self.attributedText attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:NULL];
    UIFont *font = [self.attributedText attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];
    return paragraph.lineHeightMultiple * font.pointSize;
}

- (void)setParagraphLineHeight:(CGFloat)paragraphLineHeight {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableParagraphStyle *paragraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraph.lineHeightMultiple = paragraphLineHeight / self.font.pointSize;
        paragraph.alignment = self.textAlignment;
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:@{
            NSFontAttributeName : self.font,
            NSForegroundColorAttributeName : self.textColor,
            NSParagraphStyleAttributeName : paragraph,
        }];
    });
}

@end
