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
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define HUSH_PINK_COLOR         UIColorFromRGB(0xCF2667)
#define HUSH_BROWN_COLOR        UIColorFromRGB(0xF6E3A1)
#define HUSH_BLACK_COLOR        UIColorFromRGB(0x212025)
#define HUSH_WHITE_COLOR        UIColorFromRGB(0xFFFFFF)
#define HUSH_LIGHT_GRAY_MALE    UIColorFromRGB(0xD8D8D8)
#define HUSH_LIGHT_GRAY_FEMALE  UIColorFromRGB(0x9B9B9B)
#define HUSH_BLACK_COLOR_FEMALE UIColorFromRGB(0x4A4A4A)

#import "UIColor+JSQMessages.h"

@implementation UIColor (JSQMessages)

#pragma mark - Message bubble colors

+ (UIColor *)jsq_messageBubbleGreenColor
{
    return [UIColor colorWithHue:130.0f / 360.0f
                      saturation:0.68f
                      brightness:0.84f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleBlueColor
{
    return [UIColor colorWithHue:210.0f / 360.0f
                      saturation:0.94f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleRedColor
{
    return [UIColor colorWithHue:0.0f / 360.0f
                      saturation:0.79f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleLightGrayColor
{
    return [UIColor colorWithHue:240.0f / 360.0f
                      saturation:0.02f
                      brightness:0.92f
                           alpha:1.0f];
}

+ (UIColor *)jsq_message_AppBgColor_Male { return HUSH_BLACK_COLOR; }

+ (UIColor *)jsq_message_AppBgColor_Female { return HUSH_WHITE_COLOR; }

+ (UIColor *)jsq_message_TabBarIconSelected_Male { return HUSH_BROWN_COLOR; }

+ (UIColor *)jsq_message_TabBarIcon_Male { return UIColorFromRGB(0xA5A5A7); }

+ (UIColor *)jsq_message_TabBarIconSelected_Female { return HUSH_BLACK_COLOR_FEMALE; }

+ (UIColor *)jsq_message_TabBarIcon_Female { return UIColorFromRGB(0xA5A5A7); }

+ (UIColor *)jsq_message_NavigationBarBG_Female { return HUSH_WHITE_COLOR; }

+ (UIColor *)jsq_message_NavigationBarTitle_Female { return HUSH_BLACK_COLOR_FEMALE; }

+ (UIColor *)jsq_message_NavigationBarButtons_Female  { return UIColorFromRGB(0xD83D79); }

+ (UIColor *)jsq_message_NavigationBarBG_Male { return HUSH_BLACK_COLOR; }

+ (UIColor *)jsq_message_NavigationBarTitle_Male { return HUSH_WHITE_COLOR; }

+ (UIColor *)jsq_message_NavigationBarButtons_Male { return HUSH_BROWN_COLOR; }

+ (UIColor *)jsq_message_TabBarBgColor_Male { return HUSH_BLACK_COLOR; }

+ (UIColor *)jsq_message_TabBarBgColor_Female { return UIColorFromRGB(0xF6F6F6); }

#pragma mark - Utilities

- (UIColor *)jsq_colorByDarkeningColorWithValue:(CGFloat)value
{
    NSUInteger totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0f ? 0.0f : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0f ? 0.0f : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

+ (UIColor *)jsq_message_color_ProfileName_Male { return HUSH_BROWN_COLOR; }
+ (UIColor *)jsq_message_color_ProfileName_Female { return HUSH_WHITE_COLOR; }
+ (UIColor *)jsq_message_color_ProfileLocationDistance_Male { return HUSH_LIGHT_GRAY_MALE; }
+ (UIColor *)jsq_message_color_ProfileLocationDistance_Female { return HUSH_WHITE_COLOR; }
+ (UIColor *)jsq_message_color_ProfileLocationText_Male { return HUSH_BROWN_COLOR; }
+ (UIColor *)jsq_message_color_ProfileLocationText_Female { return HUSH_PINK_COLOR; }
+ (UIColor *)jsq_message_color_ProfileLocationIcon_Male { return HUSH_BROWN_COLOR; }
+ (UIColor *)jsq_message_color_ProfileLocationIcon_Female { return HUSH_PINK_COLOR; }
+ (UIColor *)jsq_message_color_ProfileCellHeading_Male { return HUSH_LIGHT_GRAY_MALE; }
+ (UIColor *)jsq_message_color_ProfileCellHeading_Female { return HUSH_LIGHT_GRAY_FEMALE; }


@end
