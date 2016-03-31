//
//  ViewController.m
//  TryGetWifiSSID
//
//  Created by AlanYen on 2016/3/31.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import "ViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getWifiSSID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getWifiSSID {
    
    // https://github.com/simonmaddox/ios-get-current-wifi-ssid/blob/master/CaptiveNetworkTest/MDXAppDelegate.m

//    CFArrayRef networkInterfaces = CNCopySupportedInterfaces();
//    CFStringRef firstNetworkInterface =  CFArrayGetValueAtIndex(networkInterfaces, 0);
//    CFDictionaryRef networkInfo = CNCopyCurrentNetworkInfo(firstNetworkInterface);
//    if (networkInfo){
//        NSLog(@"%@", networkInfo);
//        CFRelease(networkInfo);
//    }
//    CFRelease(networkInterfaces);
    
    
//    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
//    NSLog(@"Supported interfaces: %@", ifs);
//    NSDictionary *info = nil;
//    NSDictionary *data = nil;
//    NSString *ifnam = @"";
//    for (ifnam in ifs) {
//        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
//        NSLog(@"%@", [info valueForKey:@"SSID"]);
//        if ([info allKeys] != nil) {
//            data = @{
//                     @"SSID" : info[@"SSID"],
//                     @"BSSID" : info[@"BSSID"]
//                     };
//        }
//    }
    
    NSString *wifiName = nil;
    NSArray *interFaceNames = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    for (NSString *name in interFaceNames) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)name);
        
        if (info[@"SSID"]) {
            wifiName = info[@"SSID"];
        } 
    }
}

@end
