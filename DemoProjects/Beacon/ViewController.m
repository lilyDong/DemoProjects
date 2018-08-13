//
//  ViewController.m
//  Beacon
//
//  Created by dongliyun on 2018/8/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *asBeaconBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickAsBeaconBtn:(UIButton *)sender {
}

- (IBAction)clickStartBtn:(UIButton *)sender {
//    [self startIfCan];
}

@end
