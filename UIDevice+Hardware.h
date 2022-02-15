//
//  UIDevice+Hardware.h
//  BanyuMusic
//
//  Created by 沈哲俊 on 2022/2/15.
//  Copyright © 2022 BanYuMusic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UIHardwareType) {
    UIHardwareType_unknown = 0,
    UIHardwareType_simulator,
    UIHardwareType_iphone,
    UIHardwareType_ipod,
    UIHardwareType_ipad,
    UIHardwareType_ipadMini,
    UIHardwareType_ipadAir,
    UIHardwareType_ipadPro
};

typedef NS_ENUM(NSInteger, UIHardwareModel) {
    UIHardwareModelUnknown = 0,
    UIHardwareModelSimulator = 1,
    //ipad
    UIHardwareModeliPad1,
    UIHardwareModeliPad2,
    UIHardwareModeliPad3,
    UIHardwareModeliPad4,
    UIHardwareModeliPad5,
    UIHardwareModeliPad6,
    UIHardwareModeliPad7,
    UIHardwareModeliPad8,
    UIHardwareModeliPad9,
    //ipad air
    UIHardwareModeliPadAir1,
    UIHardwareModeliPadAir2,
    UIHardwareModeliPadAir3,
    UIHardwareModeliPadAir4,

    //ipad pro
    UIHardwareModeliPadPro_12inch_1,
    UIHardwareModeliPadPro_9inch,
    UIHardwareModeliPadPro_12inch_2,
    UIHardwareModeliPadPro_10inch_1,
    UIHardwareModeliPadPro_11inch_1,
    UIHardwareModeliPadPro_12inch_3,
    UIHardwareModeliPadPro_11inch_2,
    UIHardwareModeliPadPro_12inch_4,
    UIHardwareModeliPadPro_11inch_3,
    UIHardwareModeliPadPro_12inch_5,
    //ipad mini
    UIHardwareModeliPadMini1,
    UIHardwareModeliPadMini2,
    UIHardwareModeliPadMini3,
    UIHardwareModeliPadMini4,
    UIHardwareModeliPadMini5,
    UIHardwareModeliPadMini6,
    //iphone
    UIHardwareModeliPhone1G,
    UIHardwareModeliPhone3G,
    UIHardwareModeliPhone3GS,
    UIHardwareModeliPhone4,
    UIHardwareModeliPhone4S,
    UIHardwareModeliPhone5,
    UIHardwareModeliPhone5C,
    UIHardwareModeliPhone5S,
    UIHardwareModeliPhone6,
    UIHardwareModeliPhone6p,
    UIHardwareModeliPhone6S,
    UIHardwareModeliPhone6SP,
    UIHardwareModeliPhoneSE1,
    UIHardwareModeliPhone7,
    UIHardwareModeliPhone7P,
    UIHardwareModeliPhone8,
    UIHardwareModeliPhone8P,
    UIHardwareModeliPhoneX,
    UIHardwareModeliPhoneXR,
    UIHardwareModeliPhoneXS,
    UIHardwareModeliPhoneXSM,
    UIHardwareModeliPhone11,
    UIHardwareModeliPhone11Pro,
    UIHardwareModeliPhone11ProMax,
    UIHardwareModeliPhoneSE2,
    UIHardwareModeliPhone12Mini,
    UIHardwareModeliPhone12,
    UIHardwareModeliPhone12Pro,
    UIHardwareModeliPhone12ProMax,
    UIHardwareModeliPhone13Mini,
    UIHardwareModeliPhone13,
    UIHardwareModeliPhone13Pro,
    UIHardwareModeliPhone13ProMax,
    //ipod
    UIHardwareModeliPodTouch1,
    UIHardwareModeliPodTouch2,
    UIHardwareModeliPodTouch3,
    UIHardwareModeliPodTouch4,
    UIHardwareModeliPodTouch5,
    UIHardwareModeliPodTouch6,
    UIHardwareModeliPodTouch7
};

@interface UIDevice (Hardware)

- (NSString *)hardwareModelString;

- (UIHardwareType)hardwareType;

- (UIHardwareModel)hardwareModel;

@end

NS_ASSUME_NONNULL_END
