//
//  JSQAppConfig.m
//  Pods
//
//  Created by Mursaleen's MacBook on 9/13/17.
//
//

#import "JSQAppConfig.h"
#import <UIColor+JSQMessages.h>

static JSQAppConfig *sharedInstance;

@implementation JSQAppConfig


+ (instancetype)sharedInstance {
    static dispatch_once_t DDASLLoggerOnceToken;
    dispatch_once(&DDASLLoggerOnceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (UIStatusBarStyle)statusBarStyle {
    return self.isAgency ? UIStatusBarStyleLightContent: UIStatusBarStyleDefault;
}

- (UIColor *)appBgColor {
    return self.isAgency ? [UIColor jsq_message_AppBgColor_Male] : [UIColor jsq_message_AppBgColor_Female];
}
- (UIColor *)tabbarBgColor {
    return self.isAgency ? [UIColor jsq_message_TabBarBgColor_Male] : [UIColor jsq_message_TabBarBgColor_Female];
}
- (UIColor *)tabbarSelectedColor {
    return self.isAgency ? [UIColor jsq_message_TabBarIconSelected_Male] : [UIColor jsq_message_TabBarIconSelected_Female];
}

- (UIColor *)navigationBarBgColor {
    return self.isAgency ? [UIColor jsq_message_NavigationBarBG_Male] : [UIColor jsq_message_NavigationBarBG_Female];
}
- (UIColor *)navigationBarTitleColor {
    return self.isAgency ? [UIColor jsq_message_NavigationBarTitle_Male] : [UIColor jsq_message_NavigationBarTitle_Female];
}
- (UIColor *)navigationItemColor {
    return self.isAgency ? [UIColor jsq_message_NavigationBarButtons_Male] : [UIColor jsq_message_NavigationBarButtons_Female];
}

- (UIColor *)profileUserNameColor {
    return self.isAgency ? [UIColor jsq_message_color_ProfileName_Male] : [UIColor jsq_message_color_ProfileName_Female];
}
- (UIColor *)profileUserLocationColor {
    return self.isAgency ? [UIColor jsq_message_color_ProfileLocationDistance_Male] : [UIColor jsq_message_color_ProfileLocationDistance_Female];
}
- (UIColor *)profileLocationIconColor {
    return self.isAgency ? [UIColor jsq_message_color_ProfileLocationIcon_Male] : [UIColor jsq_message_color_ProfileLocationIcon_Female];
}
- (UIColor *)profileCellHeadingColor {
    return self.isAgency ? [UIColor jsq_message_color_ProfileCellHeading_Male] : [UIColor jsq_message_color_ProfileCellHeading_Female];
}

- (UIImage *)settingsOddCellBG {
    return self.isAgency ? [UIImage imageNamed:@"CellBgOdd"] : nil;
}
- (UIImage *)settingsEvenCellBG {
    return self.isAgency ? [UIImage imageNamed:@"CellBgEven"] : nil;
}

@end
