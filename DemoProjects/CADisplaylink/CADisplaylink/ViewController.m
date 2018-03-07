//
//  ViewController.m
//  CADisplaylink
//
//  Created by 董力云 on 2018/3/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CADisplayLink *displayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)displayLinkAction:(CADisplayLink*)displayLink{
    NSLog(@"--- displayLinkAction");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
