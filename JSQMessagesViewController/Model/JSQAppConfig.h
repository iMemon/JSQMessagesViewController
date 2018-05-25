//
//  JSQAppConfig.h
//  Pods
//
//  Created by Mursaleen's MacBook on 9/13/17.
//
//

#import <Foundation/Foundation.h>

@interface JSQAppConfig : NSObject

+ (instancetype)sharedInstance;
@property (assign, nonatomic) BOOL isAgency;

@property (assign, nonatomic, readonly) UIStatusBarStyle statusBarStyle;
@property (strong, nonatomic, readonly) UIColor * appBgColor;

@property (strong, nonatomic, readonly) UIColor * tabbarBgColor;
@property (strong, nonatomic, readonly) UIColor * tabbarSelectedColor;

@property (strong, nonatomic, readonly) UIColor * navigationBarBgColor;
@property (strong, nonatomic, readonly) UIColor * navigationBarTitleColor;
@property (strong, nonatomic, readonly) UIColor * navigationItemColor;

@property (strong, nonatomic, readonly) UIColor * profileUserNameColor;
@property (strong, nonatomic, readonly) UIColor * profileUserLocationColor;
@property (strong, nonatomic, readonly) UIColor * profileLocationIconColor;
@property (strong, nonatomic, readonly) UIColor * profileCellHeadingColor;

@property (strong, nonatomic, readonly) UIImage * settingsOddCellBG;
@property (strong, nonatomic, readonly) UIImage * settingsEvenCellBG;

@end
