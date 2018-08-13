//
//  ScanViewController.m
//  Beacon
//
//  Created by dongliyun on 2018/8/8.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ScanViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ScanViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, copy) NSString *defaultUUID;
@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self beaconInit];
    [self startIfCan];
}

- (void) beaconInit{
    self.defaultUUID = @"0BC1D8B7-1B07-48B6-B148-85ECBE6412A2";
    self.defaultUUID = @"FDA50693-A4E2-4FB1-AFCF-C6EB07647825";
}

-(void)addLog:(NSString *) log {
    NSLog(@"newlog:%@",log);
    NSMutableString *text = [NSMutableString stringWithString:self.logView.text];
    [text appendFormat:@"%@ %@",[NSDate new],log];
    [text appendFormat:@"\n"];
    self.logView.text = text;
    [self.logView scrollRangeToVisible:NSMakeRange(self.logView.text.length, 1)];
}

- (void) startIfCan{
    
    BOOL availableMonitor=[CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]];
    BOOL availableRange = [CLLocationManager isRangingAvailable];
    if (availableMonitor && availableRange){
        CLAuthorizationStatus authorizationStatus=[CLLocationManager authorizationStatus];
        switch (authorizationStatus){
            case kCLAuthorizationStatusNotDetermined:{
                [self.locationManager requestWhenInUseAuthorization];
                break;
            }
            case kCLAuthorizationStatusRestricted:
            case kCLAuthorizationStatusDenied:
                NSLog(@"受限制或者拒绝");
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
            case kCLAuthorizationStatusAuthorizedWhenInUse:{
                [self start];
            }
                break;
        }
    } else {
        NSString *log = [NSString stringWithFormat:@"%@,%@",availableMonitor?@"支持CLBeaconRegion区域检测":@"不支持CLBeaconRegion区域检测",availableRange?@"支持range扫描":@"不支持range扫描"];
        [self addLog:log];
    }
}

- (void)start{
    [self stop];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    //    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)stop{
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    [self.locationManager stopMonitoringForRegion:self.beaconRegion];
}
#pragma mark - CLLocationManagerDelegate AuthorizationStatus

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    [self startIfCan];
}

#pragma mark - CLLocationManagerDelegate Ranging

// 每秒调用一次
- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region{
    NSString *log = [NSString stringWithFormat:@"[didRangeBeacons],beacons:%@",beacons.count >0 ? beacons:@0];
    [self addLog:log];
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error{
    NSLog(@"error:%@",error);
    
}
#pragma mark - CLLocationManagerDelegate Monitoring

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region{
    NSLog(@"%s",__func__);
    
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error{
    NSLog(@"%@",error);
    
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region{
    NSLog(@"%s",__func__);
    
}
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    NSLog(@"%s",__func__);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(nonnull CLRegion *)region{
    NSLog(@"%s",__func__);
    
}
#pragma mark - getter and setter

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLBeaconRegion *)beaconRegion{
    if (!_beaconRegion) {
        _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:self.defaultUUID] identifier:@"beacon-identifier"];
        _beaconRegion.notifyOnExit =  YES; // 离开区域收到通知，默认就是YES
        _beaconRegion.notifyOnEntry = YES;// 进入区域收到通知，默认就是YES
        _beaconRegion.notifyEntryStateOnDisplay = YES; // 屏幕点亮且在区域内时收到通知,默认是NO
    }
    return _beaconRegion;
}
@end
