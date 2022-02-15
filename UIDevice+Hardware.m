//
//  UIDevice+Hardware.m
//  BanyuMusic
//
//  Created by 沈哲俊 on 2022/2/15.
//  Copyright © 2022 BanYuMusic. All rights reserved.
//

#import "UIDevice+Hardware.h"
#include <sys/sysctl.h>
#import <sys/utsname.h>

@implementation UIDevice (Hardware)

- (NSString *)hardwareModelString {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *str =  [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return str;
}

- (UIHardwareType)hardwareType {
    NSString *hwString = [self hardwareModelString];
    if (hwString.length <= 0) {
        return UIHardwareType_unknown;
    }
    
    if([hwString isEqualToString: @"i386"] ||
       [hwString isEqualToString:@"x86_64"]) {
        return UIHardwareType_simulator;
    }
    
    if ([hwString isEqualToString:@"iPad1,1"] ||
        [hwString isEqualToString:@"iPad2,1"] ||
        [hwString isEqualToString:@"iPad2,2"] ||
        [hwString isEqualToString:@"iPad2,3"] ||
        [hwString isEqualToString:@"iPad2,4"] ||
        [hwString isEqualToString:@"iPad3,1"] ||
        [hwString isEqualToString:@"iPad3,2"] ||
        [hwString isEqualToString:@"iPad3,3"] ||
        [hwString isEqualToString:@"iPad3,4"] ||
        [hwString isEqualToString:@"iPad3,5"] ||
        [hwString isEqualToString:@"iPad3,6"] ||
        [hwString isEqualToString:@"iPad6,11"] ||
        [hwString isEqualToString:@"iPad6,12"] ||
        [hwString isEqualToString:@"iPad7,5"] ||
        [hwString isEqualToString:@"iPad7,6"] ||
        [hwString isEqualToString:@"iPad7,11"] ||
        [hwString isEqualToString:@"iPad7,12"] ||
        [hwString isEqualToString:@"iPad11,6"] ||
        [hwString isEqualToString:@"iPad11,7"] ||
        [hwString isEqualToString:@"iPad12,1"] ||
        [hwString isEqualToString:@"iPad12,2"]) {
        return UIHardwareType_ipad;
    }
    
    
    if ([hwString isEqualToString:@"iPad4,1"] ||
        [hwString isEqualToString:@"iPad4,2"] ||
        [hwString isEqualToString:@"iPad4,3"] ||
        [hwString isEqualToString:@"iPad5,3"] ||
        [hwString isEqualToString:@"iPad5,4"] ||
        [hwString isEqualToString:@"iPad11,3"] ||
        [hwString isEqualToString:@"iPad11,4"] ||
        [hwString isEqualToString:@"iPad13,1"] ||
        [hwString isEqualToString:@"iPad13,2"]) {
        return UIHardwareType_ipadAir;
    }
    
    if ([hwString isEqualToString:@"iPad6,7"] ||
        [hwString isEqualToString:@"iPad6,8"] ||
        [hwString isEqualToString:@"iPad6,3"] ||
        [hwString isEqualToString:@"iPad6,4"] ||
        [hwString isEqualToString:@"iPad7,1"] ||
        [hwString isEqualToString:@"iPad7,2"] ||
        [hwString isEqualToString:@"iPad7,3"] ||
        [hwString isEqualToString:@"iPad7,4"] ||
        [hwString isEqualToString:@"iPad8,1"] ||
        [hwString isEqualToString:@"iPad8,2"] ||
        [hwString isEqualToString:@"iPad8,3"] ||
        [hwString isEqualToString:@"iPad8,4"] ||
        [hwString isEqualToString:@"iPad8,5"] ||
        [hwString isEqualToString:@"iPad8,6"] ||
        [hwString isEqualToString:@"iPad8,7"] ||
        [hwString isEqualToString:@"iPad8,8"] ||
        [hwString isEqualToString:@"iPad8,9"] ||
        [hwString isEqualToString:@"iPad8,10"] ||
        [hwString isEqualToString:@"iPad8,11"] ||
        [hwString isEqualToString:@"iPad8,12"] ||
        [hwString isEqualToString:@"iPad13,4"] ||
        [hwString isEqualToString:@"iPad13,5"] ||
        [hwString isEqualToString:@"iPad13,6"] ||
        [hwString isEqualToString:@"iPad13,7"] ||
        [hwString isEqualToString:@"iPad13,8"] ||
        [hwString isEqualToString:@"iPad13,9"] ||
        [hwString isEqualToString:@"iPad13,10"] ||
        [hwString isEqualToString:@"iPad13,11"]) {
        return UIHardwareType_ipadPro;
    }
    
    if ([hwString isEqualToString:@"iPad2,5"] ||
        [hwString isEqualToString:@"iPad2,6"] ||
        [hwString isEqualToString:@"iPad2,7"] ||
        [hwString isEqualToString:@"iPad4,4"] ||
        [hwString isEqualToString:@"iPad4,5"] ||
        [hwString isEqualToString:@"iPad4,6"] ||
        [hwString isEqualToString:@"iPad4,7"] ||
        [hwString isEqualToString:@"iPad4,8"] ||
        [hwString isEqualToString:@"iPad4,9"] ||
        [hwString isEqualToString:@"iPad5,1"] ||
        [hwString isEqualToString:@"iPad5,2"] ||
        [hwString isEqualToString:@"iPad11,1"] ||
        [hwString isEqualToString:@"iPad11,2"] ||
        [hwString isEqualToString:@"iPad14,1"] ||
        [hwString isEqualToString:@"iPad14,2"]) {
        return UIHardwareType_ipadMini;
    }
    
    if ([hwString containsString:@"iPhone"]) {
        return UIHardwareType_iphone;
    }
    
    if ([hwString containsString:@"iPod"]) {
        return UIHardwareType_ipod;
    }
    
    return UIHardwareType_unknown;
}

- (UIHardwareModel)hardwareModel {
    
    UIHardwareType type = [self hardwareType];
    if (type == UIHardwareType_unknown) {
        return UIHardwareModelUnknown;
    }
    
    if (type == UIHardwareType_simulator) {
        return UIHardwareModelSimulator;
    }
    
    
    NSString *hwString = [self hardwareModelString];
    
    UIHardwareModel hardwareModel = UIHardwareModelUnknown;
    
    switch (type) {
        case UIHardwareType_ipad:
        {
            if ([hwString isEqualToString:@"iPad1,1"]) {
                hardwareModel = UIHardwareModeliPad1;
            }
            else if ([hwString containsString:@"iPad2,"]) {
                hardwareModel = UIHardwareModeliPad2;
            }
            else if ([hwString isEqualToString:@"iPad3,1"] || [hwString isEqualToString:@"iPad3,2"] || [hwString isEqualToString:@"iPad3,3"]) {
                hardwareModel = UIHardwareModeliPad3;
            }
            else if ([hwString isEqualToString:@"iPad3,4"] || [hwString isEqualToString:@"iPad3,5"] || [hwString isEqualToString:@"iPad3,6"]) {
                hardwareModel = UIHardwareModeliPad4;
            }
            else if ([hwString containsString:@"iPad6,"]) {
                hardwareModel = UIHardwareModeliPad5;
            }
            else if ([hwString isEqualToString:@"iPad7,5"] || [hwString isEqualToString:@"iPad7,6"]) {
                hardwareModel = UIHardwareModeliPad6;
            }
            else if ([hwString isEqualToString:@"iPad7,11"] || [hwString isEqualToString:@"iPad7,12"]) {
                hardwareModel = UIHardwareModeliPad7;
            }
            else if ([hwString containsString:@"iPad11,"]) {
                hardwareModel = UIHardwareModeliPad8;
            }
            else if ([hwString containsString:@"iPad12,"]) {
                hardwareModel = UIHardwareModeliPad9;
            }
        }
            break;
        case UIHardwareType_ipadAir:
        {
            if ([hwString containsString:@"iPad4,"]) {
                hardwareModel = UIHardwareModeliPadAir1;
            }
            else if ([hwString containsString:@"iPad5,"]) {
                hardwareModel = UIHardwareModeliPadAir2;
            }
            else if ([hwString containsString:@"iPad11,"]) {
                hardwareModel = UIHardwareModeliPadAir3;
            }
            else if ([hwString containsString:@"iPad13,"]) {
                hardwareModel = UIHardwareModeliPadAir4;
            }
        }
            break;
        case UIHardwareType_ipadPro:
        {
            if ([hwString isEqualToString:@"iPad6,7"] || [hwString isEqualToString:@"iPad6,8"]) {
                hardwareModel = UIHardwareModeliPadPro_12inch_1;
            }
            else if ([hwString isEqualToString:@"iPad6,3"] || [hwString isEqualToString:@"iPad6,4"]) {
                hardwareModel = UIHardwareModeliPadPro_9inch;
            }
            else if ([hwString isEqualToString:@"iPad7,1"] || [hwString isEqualToString:@"iPad7,2"]) {
                hardwareModel = UIHardwareModeliPadPro_12inch_2;
            }
            else if ([hwString isEqualToString:@"iPad7,3"] || [hwString isEqualToString:@"iPad7,4"]) {
                hardwareModel = UIHardwareModeliPadPro_10inch_1;
            }
            else if ([hwString isEqualToString:@"iPad8,1"] || [hwString isEqualToString:@"iPad8,2"] || [hwString isEqualToString:@"iPad8,3"] || [hwString isEqualToString:@"iPad8,4"]) {
                hardwareModel = UIHardwareModeliPadPro_11inch_1;
            }
            else if ([hwString isEqualToString:@"iPad8,5"] || [hwString isEqualToString:@"iPad8,6"] || [hwString isEqualToString:@"iPad8,7"] || [hwString isEqualToString:@"iPad8,8"]) {
                hardwareModel = UIHardwareModeliPadPro_12inch_3;
            }
            else if ([hwString isEqualToString:@"iPad8,9"] || [hwString isEqualToString:@"iPad8,10"]) {
                hardwareModel = UIHardwareModeliPadPro_11inch_2;
            }
            else if ([hwString isEqualToString:@"iPad8,11"] || [hwString isEqualToString:@"iPad8,12"]) {
                hardwareModel = UIHardwareModeliPadPro_12inch_4;
            }
            else if ([hwString isEqualToString:@"iPad13,4"] || [hwString isEqualToString:@"iPad13,5"] || [hwString isEqualToString:@"iPad13,6"] || [hwString isEqualToString:@"iPad13,7"]) {
                hardwareModel = UIHardwareModeliPadPro_11inch_3;
            }
            else if ([hwString isEqualToString:@"iPad13,8"] || [hwString isEqualToString:@"iPad13,9"] || [hwString isEqualToString:@"iPad13,10"] || [hwString isEqualToString:@"iPad13,11"]) {
                hardwareModel = UIHardwareModeliPadPro_12inch_5;
            }
        }
            break;
        case UIHardwareType_ipadMini:
        {
            if ([hwString containsString:@"iPad2,"]) {
                hardwareModel = UIHardwareModeliPadMini1;
            }
            else if ([hwString isEqualToString:@"iPad4,4"] || [hwString isEqualToString:@"iPad4,5"] || [hwString isEqualToString:@"iPad4,6"]) {
                hardwareModel = UIHardwareModeliPadMini2;
            }
            else if ([hwString isEqualToString:@"iPad4,7"] || [hwString isEqualToString:@"iPad4,8"] || [hwString isEqualToString:@"iPad4,9"]) {
                hardwareModel = UIHardwareModeliPadMini3;
            }
            else if ([hwString containsString:@"iPad5,"]) {
                hardwareModel = UIHardwareModeliPadMini4;
            }
            else if ([hwString containsString:@"iPad11,"]) {
                hardwareModel = UIHardwareModeliPadMini5;
            }
            else if ([hwString containsString:@"iPad14,"]) {
                hardwareModel = UIHardwareModeliPadMini6;
            }
        }
            break;
        case UIHardwareType_iphone:
        {
            if ([hwString isEqualToString:@"iPhone1,1"]) {
                hardwareModel = UIHardwareModeliPhone1G;
            }
            else if ([hwString isEqualToString:@"iPhone1,2"]) {
                hardwareModel = UIHardwareModeliPhone3G;
            }
            else if ([hwString isEqualToString:@"iPhone2,1"]) {
                hardwareModel = UIHardwareModeliPhone3GS;
            }
            else if ([hwString containsString:@"iPhone3,"]) {
                hardwareModel = UIHardwareModeliPhone4;
            }
            else if ([hwString isEqualToString:@"iPhone4,1"]) {
                hardwareModel = UIHardwareModeliPhone4S;
            }
            else if ([hwString isEqualToString:@"iPhone5,1"] || [hwString isEqualToString:@"iPhone5,2"]) {
                hardwareModel = UIHardwareModeliPhone5;
            }
            else if ([hwString isEqualToString:@"iPhone5,3"] || [hwString isEqualToString:@"iPhone5,4"]) {
                hardwareModel = UIHardwareModeliPhone5C;
            }
            else if ([hwString containsString:@"iPhone6,"]) {
                hardwareModel = UIHardwareModeliPhone5S;
            }
            else if ([hwString isEqualToString:@"iPhone7,2"]) {
                hardwareModel = UIHardwareModeliPhone6;
            }
            else if ([hwString isEqualToString:@"iPhone7,1"]) {
                hardwareModel = UIHardwareModeliPhone6p;
            }
            else if ([hwString isEqualToString:@"iPhone8,1"]) {
                hardwareModel = UIHardwareModeliPhone6S;
            }
            else if ([hwString isEqualToString:@"iPhone8,2"]) {
                hardwareModel = UIHardwareModeliPhone6SP;
            }
            else if ([hwString isEqualToString:@"iPhone8,4"]) {
                hardwareModel = UIHardwareModeliPhoneSE1;
            }
            else if ([hwString isEqualToString:@"iPhone9,1"] || [hwString isEqualToString:@"iPhone9,3"]) {
                hardwareModel = UIHardwareModeliPhone7;
            }
            else if ([hwString isEqualToString:@"iPhone9,2"] || [hwString isEqualToString:@"iPhone9,4"]) {
                hardwareModel = UIHardwareModeliPhone7P;
            }
            else if ([hwString isEqualToString:@"iPhone10,1"] || [hwString isEqualToString:@"iPhone10,4"]) {
                hardwareModel = UIHardwareModeliPhone8;
            }
            else if ([hwString isEqualToString:@"iPhone10,2"] || [hwString isEqualToString:@"iPhone10,5"]) {
                hardwareModel = UIHardwareModeliPhone8P;
            }
            else if ([hwString isEqualToString:@"iPhone10,3"] || [hwString isEqualToString:@"iPhone10,6"]) {
                hardwareModel = UIHardwareModeliPhoneX;
            }
            else if ([hwString isEqualToString:@"iPhone11,8"]) {
                hardwareModel = UIHardwareModeliPhoneXR;
            }
            else if ([hwString isEqualToString:@"iPhone11,2"]) {
                hardwareModel = UIHardwareModeliPhoneXS;
            }
            else if ([hwString isEqualToString:@"iPhone11,6"] || [hwString isEqualToString:@"iPhone11,4"]) {
                hardwareModel = UIHardwareModeliPhoneXSM;
            }
            else if ([hwString isEqualToString:@"iPhone12,1"]) {
                hardwareModel = UIHardwareModeliPhone11;
            }
            else if ([hwString isEqualToString:@"iPhone12,3"]) {
                hardwareModel = UIHardwareModeliPhone11Pro;
            }
            else if ([hwString isEqualToString:@"iPhone12,5"]) {
                hardwareModel = UIHardwareModeliPhone11ProMax;
            }
            else if ([hwString isEqualToString:@"iPhone12,8"]) {
                hardwareModel = UIHardwareModeliPhoneSE2;
            }
            else if ([hwString isEqualToString:@"iPhone13,1"]) {
                hardwareModel = UIHardwareModeliPhone12Mini;
            }
            else if ([hwString isEqualToString:@"iPhone13,2"]) {
                hardwareModel = UIHardwareModeliPhone12;
            }
            else if ([hwString isEqualToString:@"iPhone13,3"]) {
                hardwareModel = UIHardwareModeliPhone12Pro;
            }
            else if ([hwString isEqualToString:@"iPhone13,4"]) {
                hardwareModel = UIHardwareModeliPhone12ProMax;
            }
            else if ([hwString isEqualToString:@"iPhone14,4"]) {
                hardwareModel = UIHardwareModeliPhone13Mini;
            }
            else if ([hwString isEqualToString:@"iPhone14,5"]) {
                hardwareModel = UIHardwareModeliPhone13;
            }
            else if ([hwString isEqualToString:@"iPhone14,2"]) {
                hardwareModel = UIHardwareModeliPhone13Pro;
            }
            else if ([hwString isEqualToString:@"iPhone14,3"]) {
                hardwareModel = UIHardwareModeliPhone13ProMax;
            }
        }
            break;
        case UIHardwareType_ipod:
        {
            if ([hwString isEqualToString:@"iPod1,1"]) {
                hardwareModel = UIHardwareModeliPodTouch1;
            }
            else if ([hwString isEqualToString:@"iPod2,1"]) {
                hardwareModel = UIHardwareModeliPodTouch2;
            }
            else if ([hwString isEqualToString:@"iPod3,1"]) {
                hardwareModel = UIHardwareModeliPodTouch3;
            }
            else if ([hwString isEqualToString:@"iPod4,1"]) {
                hardwareModel = UIHardwareModeliPodTouch4;
            }
            else if ([hwString isEqualToString:@"iPod5,1"]) {
                hardwareModel = UIHardwareModeliPodTouch5;
            }
            else if ([hwString isEqualToString:@"iPod7,1"]) {
                hardwareModel = UIHardwareModeliPodTouch6;
            }
            else if ([hwString isEqualToString:@"iPod9,1"]) {
                hardwareModel = UIHardwareModeliPodTouch7;
            }
        }
            break;
            
        default:
            break;
    }
    
    return hardwareModel;
}

@end
