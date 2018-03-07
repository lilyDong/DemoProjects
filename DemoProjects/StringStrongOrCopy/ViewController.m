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
    
    NSString *str = @"1234";
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte b[4] ;
    [data getBytes:b length:[data length]];
    unsigned ret = bytesToInt(b);
    
    char a = 0xaa;
    unsigned int c = a << 8;
    int d = a << 8;

    NSMutableString *mutableString = [NSMutableString stringWithString:@"hello"];
    self.strStrong = mutableString;
    self.strCopy = mutableString;
    
    NSLog(@"strStrong:%@",self.strStrong);
    NSLog(@"strCopy:%@",self.strCopy);
    
    [mutableString appendString:@" world"];
    NSLog(@"strStrong:%@",self.strStrong);
    NSLog(@"strCopy:%@",self.strCopy);
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

unsigned int bytesToInt (Byte* bytes){
    unsigned a = bytes[0] & 0xFF;
    a |= ((bytes[1] << 8) & 0xFF00);
    a |= ((bytes[2] << 16) & 0xFF0000);
    a |= ((bytes[3] << 24) & 0xFF000000);
    return a;
}

- (void)btnAction:(UIButton*)btn{
    NSLog(@"点击了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
