//
//  FITArticleTableViewCell.m
//  Fitness
//
//  Created by Tedzhou on 17/3/11.
//  Copyright © 2017年 fitness. All rights reserved.
//

#import "FITArticleTableViewCell.h"
//#import "PBTrend+Util.h"
//#import "UIImageView+FITImage.h"
//#import "FITArticleDetailViewController.h"
//#import "UIViewController+Utils.h"
//#import "FITFeedModel.h"
//#import "Common.pbobjc.h"
//#import "PBMedia+Util.h"

@interface FITArticleTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *leftTrendImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftTrendMessage;
@property (weak, nonatomic) IBOutlet UILabel *leftLike;
@property (weak, nonatomic) IBOutlet UILabel *leftComment;
@property (weak, nonatomic) IBOutlet UIImageView *leftFlagImageView;


@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIImageView *rightTrendImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLike;
@property (weak, nonatomic) IBOutlet UILabel *rightComment;
@property (weak, nonatomic) IBOutlet UILabel *rightMessage;
@property (weak, nonatomic) IBOutlet UIImageView *rightFlagImageView;

@end


@implementation FITArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (IBAction)onLeftTap:(id)sender
{
//    if (self.leftArticle)
//    {
//        FITArticleDetailViewController *vc = [[FITArticleDetailViewController alloc] init];
//        vc.article = self.leftArticle;
//        [[UIViewController currentViewController].navigationController pushViewController:vc animated:YES];
//    }
}

- (IBAction)onRightTap:(id)sender
{
//    if (self.rightArticle)
//    {
//        FITArticleDetailViewController *vc = [[FITArticleDetailViewController alloc] init];
//        vc.article = self.rightArticle;
//        [[UIViewController currentViewController].navigationController pushViewController:vc animated:YES];
//    }
}

//- (void)setLeftArticle:(FITFeedModel *)leftArticle
//{
//    _leftArticle = leftArticle;
//    if (leftArticle == nil) {
//        self.leftView.hidden = YES;
//    }
//    else
//    {
//        self.leftView.hidden = NO;
//
//
//        self.leftTrendMessage.text = leftArticle.content;
//        self.leftLike.text = [@(leftArticle.likeTotal) stringValue];
//        self.leftComment.text = [@(leftArticle.replyTotal) stringValue];
//
//        NSArray *pic_urls = leftArticle.picUrls;
//        if (pic_urls.count > 0)
//        {
//            [self.leftTrendImageView setFeedUrl:pic_urls.firstObject];
//            if (pic_urls.count > 1)
//            {
//                self.leftFlagImageView.hidden = NO;
//                self.leftFlagImageView.image = [UIImage imageNamed:@"feed_mult_icon"];
//            }
//            else
//            {
//                self.leftFlagImageView.hidden = YES;
//            }
//        }
//        else
//        {
//
//            PBMedia *media = [leftArticle.multiMedia.mediasArray firstObject];
//            if (media.videoImage)
//            {
//                self.leftTrendImageView.image = media.videoImage;
//            }
//            else if (media.videoUrl.length > 0)
//            {
//                [self.leftTrendImageView setFeedVedioUrl:media.videoUrl width:media.video.width height:media.video.heigth];
//            }
//            else
//            {
//                [self.leftTrendImageView setFeedUrl:pic_urls.firstObject];
//            }
//
//            self.leftFlagImageView.hidden = NO;
//            self.leftFlagImageView.image = [UIImage imageNamed:@"feed_video"];
//
//        }
//    }
//}
//
//- (void)setRightArticle:(FITFeedModel *)rightArticle
//{
//    _rightArticle = rightArticle;
//
//    if (rightArticle == nil) {
//        self.rightView.hidden = YES;
//    }
//    else
//    {
//        self.rightView.hidden = NO;
//
//
//        self.rightMessage.text = rightArticle.content;
//        self.rightLike.text = [@(_rightArticle.likeTotal) stringValue];
//        self.rightComment.text = [@(_rightArticle.replyTotal) stringValue];
//
//        NSArray *pic_urls = rightArticle.picUrls;
//        if (pic_urls.count > 0)
//        {
//            [self.rightTrendImageView setFeedUrl:pic_urls.firstObject];
//            if (pic_urls.count > 1)
//            {
//                self.rightFlagImageView.hidden = NO;
//                self.rightFlagImageView.image = [UIImage imageNamed:@"feed_mult_icon"];
//            }
//            else
//            {
//                self.rightFlagImageView.hidden = YES;
//            }
//        }
//        else
//        {
//
//            PBMedia *media = [rightArticle.multiMedia.mediasArray firstObject];
//            if (media.videoImage)
//            {
//                self.rightTrendImageView.image = media.videoImage;
//            }
//            else if (media.videoUrl.length > 0)
//            {
//                [self.rightTrendImageView setFeedVedioUrl:media.videoUrl width:media.video.width height:media.video.heigth];
//            }
//            else
//            {
//                [self.rightTrendImageView setFeedUrl:pic_urls.firstObject];
//            }
//
//            self.rightFlagImageView.hidden = NO;
//            self.rightFlagImageView.image = [UIImage imageNamed:@"feed_video"];
//        }
//    }
//}

+ (CGFloat)height
{
    return (SCREEN_WIDTH - 15 * 3) / 2 + 8 + 38 + 38;
}

@end
