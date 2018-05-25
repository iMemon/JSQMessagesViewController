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

#import <UIKit/UIKit.h>

@interface UIColor (JSQMessages)

#pragma mark - Message bubble colors

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app green bubble color.
 */
+ (UIColor *)jsq_messageBubbleGreenColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app blue bubble color.
 */
+ (UIColor *)jsq_messageBubbleBlueColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 red color.
 */
+ (UIColor *)jsq_messageBubbleRedColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app light gray bubble color.
 */
+ (UIColor *)jsq_messageBubbleLightGrayColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app light gray Female background color.
 */
+ (UIColor *)jsq_message_BackgroundLightGrayFemaleColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app black color Female color.
 */
+ (UIColor *)jsq_message_BlackFemaleColor;


/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app light gray Male background color.
 */
+ (UIColor *)jsq_message_BackgroundLightGrayMaleColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Female App Background color.
 */
+ (UIColor *)jsq_message_AppBgColor_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Male App Background color.
 */
+ (UIColor *)jsq_message_AppBgColor_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush brown color.
 */
+ (UIColor *)jsq_message_HushBrownColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush pink color.
 */
+ (UIColor *)jsq_message_HushPinkColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Male Bg color.
 */
+ (UIColor *)jsq_message_TabBarBgColor_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Female Bg color.
 */
+ (UIColor *)jsq_message_TabBarBgColor_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Male Selected Bg color.
 */
+ (UIColor *)jsq_message_TabBarIconSelected_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Male Icon color.
 */
+ (UIColor *)jsq_message_TabBarIcon_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Female Selected Bg color.
 */
+ (UIColor *)jsq_message_TabBarIconSelected_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush Tabbar Female Icon color.
 */
+ (UIColor *)jsq_message_TabBarIcon_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar BG Female Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarBG_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar Title Female Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarTitle_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar Button Female Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarButtons_Female;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar BG Male Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarBG_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar Title Male Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarTitle_Male;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app hush NavBar Button Male Icon color.
 */
+ (UIColor *)jsq_message_NavigationBarButtons_Male;

#pragma mark - Utilities

/**
 *  Creates and returns a new color object whose brightness component is decreased by the given value, using the initial color values of the receiver.
 *
 *  @param value A floating point value describing the amount by which to decrease the brightness of the receiver.
 *
 *  @return A new color object whose brightness is decreased by the given values. The other color values remain the same as the receiver.
 */
- (UIColor *)jsq_colorByDarkeningColorWithValue:(CGFloat)value;


#pragma mark - Profile Module

+ (UIColor *)jsq_message_color_ProfileName_Male;
+ (UIColor *)jsq_message_color_ProfileName_Female;
+ (UIColor *)jsq_message_color_ProfileLocationDistance_Male;
+ (UIColor *)jsq_message_color_ProfileLocationDistance_Female;

+ (UIColor *)jsq_message_color_ProfileLocationText_Male;
+ (UIColor *)jsq_message_color_ProfileLocationText_Female;
+ (UIColor *)jsq_message_color_ProfileLocationIcon_Male;
+ (UIColor *)jsq_message_color_ProfileLocationIcon_Female;

+ (UIColor *)jsq_message_color_ProfileCellHeading_Male;
+ (UIColor *)jsq_message_color_ProfileCellHeading_Female;

@end
