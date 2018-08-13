//
//  ViewController.m
//  BeaconMac
//
//  Created by dongliyun on 2018/8/8.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController() <CBCentralManagerDelegate>
@property (weak) IBOutlet NSButton *startBtn;
@property (nonatomic, strong) CBCentralManager *centralManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSLog(@"state:%ld",central.state);
}

- (void)viewDidAppear{
    [super viewDidAppear];
}
- (void)viewWillDisappear{
    [super viewWillDisappear];
}

- (IBAction)clickStartBtn:(NSButton *)sender {
}
@end
