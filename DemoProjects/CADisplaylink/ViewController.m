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
//    frameInterval 默认值是1，表示每次更新display frame 都会触发displayLinkAction：。设置为2，表示每改变两次会触发selector。
//    self.displayLink.frameInterval = 2;
    
    // frameInterval 设置为60，因为屏幕每秒刷新60次，这样相当于一秒触发一次selector。
    self.displayLink.frameInterval = 60;

    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)displayLinkAction:(CADisplayLink*)displayLink{
    NSLog(@"--- displayLinkAction");
}

- (void)stop{
    [self.displayLink setPaused:YES];
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink = nil;
}

@end
