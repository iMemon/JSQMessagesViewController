//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesAvatarImageFactory.h"

#import "UIColor+JSQMessages.h"

//==============================//

@interface UIImage (JSQMessagesUIImageResize)
- (UIImage *)imageByCroppingImageToSize:(CGSize)size;
@end

@implementation UIImage (JSQMessagesUIImageResize)
- (UIImage *)imageByCroppingImageToSize:(CGSize)size
{
    double newCropWidth, newCropHeight;
    //=== To crop more efficently =====//
    if(self.size.width < self.size.height){
        if (self.size.width < size.width) {
            newCropWidth = size.width;
        }
        else {
            newCropWidth = self.size.width;
        }
        newCropHeight = (newCropWidth * size.height)/size.width;
    } else {
        if (self.size.height < size.height) {
            newCropHeight = size.height;
        }
        else {
            newCropHeight = self.size.height;
        }
        newCropWidth = (newCropHeight * size.width)/size.height;
    }
    double x = self.size.width/2.0 - newCropWidth/2.0;
    double y = self.size.height/2.0 - newCropHeight/2.0;
    CGRect cropRect = CGRectMake(x, y, newCropWidth, newCropHeight);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], cropRect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
}
@end

//==============================//

@implementation JSQMessagesAvatarImageFactory

#pragma mark - Public

+ (JSQMessagesAvatarImage *)avatarImageWithPlaceholder:(UIImage *)placeholderImage diameter:(NSUInteger)diameter
{
    UIImage *circlePlaceholderImage = [JSQMessagesAvatarImageFactory jsq_circularImage:placeholderImage
                                                                          withDiameter:diameter
                                                                      highlightedColor:nil];

    return [JSQMessagesAvatarImage avatarImageWithPlaceholder:circlePlaceholderImage];
}

+ (JSQMessagesAvatarImage *)avatarImageWithImage:(UIImage *)image diameter:(NSUInteger)diameter
{
    UIImage *avatar = [JSQMessagesAvatarImageFactory circularAvatarImage:image withDiameter:diameter];
    UIImage *highlightedAvatar = [JSQMessagesAvatarImageFactory circularAvatarHighlightedImage:image withDiameter:diameter];

    return [[JSQMessagesAvatarImage alloc] initWithAvatarImage:avatar
                                              highlightedImage:highlightedAvatar
                                              placeholderImage:avatar];
}

+ (UIImage *)circularAvatarImage:(UIImage *)image withDiameter:(NSUInteger)diameter
{
    return [JSQMessagesAvatarImageFactory jsq_circularImage:image
                                               withDiameter:diameter
                                           highlightedColor:nil];
}

+ (UIImage *)circularAvatarHighlightedImage:(UIImage *)image withDiameter:(NSUInteger)diameter
{
    return [JSQMessagesAvatarImageFactory jsq_circularImage:image
                                               withDiameter:diameter
                                           highlightedColor:[UIColor colorWithWhite:0.1f alpha:0.3f]];
}

+ (JSQMessagesAvatarImage *)avatarImageWithUserInitials:(NSString *)userInitials
                                        backgroundColor:(UIColor *)backgroundColor
                                              textColor:(UIColor *)textColor
                                                   font:(UIFont *)font
                                               diameter:(NSUInteger)diameter
{
    UIImage *avatarImage = [JSQMessagesAvatarImageFactory jsq_imageWitInitials:userInitials
                                                               backgroundColor:backgroundColor
                                                                     textColor:textColor
                                                                          font:font
                                                                      diameter:diameter];

    UIImage *avatarHighlightedImage = [JSQMessagesAvatarImageFactory jsq_circularImage:avatarImage
                                                                          withDiameter:diameter
                                                                      highlightedColor:[UIColor colorWithWhite:0.1f alpha:0.3f]];

    return [[JSQMessagesAvatarImage alloc] initWithAvatarImage:avatarImage
                                              highlightedImage:avatarHighlightedImage
                                              placeholderImage:avatarImage];
}

#pragma mark - Private

+ (UIImage *)jsq_imageWitInitials:(NSString *)initials
                  backgroundColor:(UIColor *)backgroundColor
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                         diameter:(NSUInteger)diameter
{
    NSParameterAssert(initials != nil);
    NSParameterAssert(backgroundColor != nil);
    NSParameterAssert(textColor != nil);
    NSParameterAssert(font != nil);
    NSParameterAssert(diameter > 0);

    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);

    NSDictionary *attributes = @{ NSFontAttributeName : font,
                                  NSForegroundColorAttributeName : textColor };

    CGRect textFrame = [initials boundingRectWithSize:frame.size
                                              options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                           attributes:attributes
                                              context:nil];

    CGPoint frameMidPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    CGPoint textFrameMidPoint = CGPointMake(CGRectGetMidX(textFrame), CGRectGetMidY(textFrame));

    CGFloat dx = frameMidPoint.x - textFrameMidPoint.x;
    CGFloat dy = frameMidPoint.y - textFrameMidPoint.y;
    CGPoint drawPoint = CGPointMake(dx, dy);
    UIImage *image = nil;

    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
        CGContextFillRect(context, frame);
        [initials drawAtPoint:drawPoint withAttributes:attributes];

        image = UIGraphicsGetImageFromCurrentImageContext();

    }
    UIGraphicsEndImageContext();

    return [JSQMessagesAvatarImageFactory jsq_circularImage:image withDiameter:diameter highlightedColor:nil];
}

+ (UIImage *)jsq_circularImage:(UIImage *)image withDiameter:(NSUInteger)diameter highlightedColor:(UIColor *)highlightedColor
{
    NSParameterAssert(image != nil);
    NSParameterAssert(diameter > 0);

    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    UIImage * squareImage = [image imageByCroppingImageToSize:frame.size];
    return squareImage;
//    UIImage * squareImage = image;
    UIImage *newImage = nil;

    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();

        UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frame];
        [imgPath addClip];
        [squareImage drawInRect:frame];

        if (highlightedColor != nil) {
            CGContextSetFillColorWithColor(context, highlightedColor.CGColor);
            CGContextFillEllipseInRect(context, frame);
        }

        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

//+ (UIImage *)jsq_circularImage:(UIImage *)image withDiameter:(NSUInteger)diameter highlightedColor:(UIColor *)highlightedColor
//{
//    NSParameterAssert(image != nil);
//    NSParameterAssert(diameter > 0);
//    diameter = 1;
//    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
//    UIImage *newImage = nil;
//    
//    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
//    {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        
//        UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frame];
//        [imgPath addClip];
//        [image drawInRect:frame];
//        
//        if (highlightedColor != nil) {
//            CGContextSetFillColorWithColor(context, highlightedColor.CGColor);
//            CGContextFillEllipseInRect(context, frame);
//        }
//        
//        newImage = UIGraphicsGetImageFromCurrentImageContext();
//        
//    }
//    UIGraphicsEndImageContext();
//    
//    return image;
//}

@end
