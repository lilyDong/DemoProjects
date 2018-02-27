//
//  ViewController.m
//  StringStrongOrCopy
//
//  Created by 董力云 on 2018/2/27.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *strStrong;
@property (nonatomic, copy) NSString *strCopy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableString *mutableString = [NSMutableString stringWithString:@"hello"];
    self.strStrong = mutableString;
    self.strCopy = mutableString;
    
    NSLog(@"strStrong:%@",self.strStrong);
    NSLog(@"strCopy:%@",self.strCopy);
    
    [mutableString appendString:@" world"];
    NSLog(@"strStrong:%@",self.strStrong);
    NSLog(@"strCopy:%@",self.strCopy);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
