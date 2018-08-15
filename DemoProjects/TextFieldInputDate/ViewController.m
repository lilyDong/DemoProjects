//
//  ViewController.m
//  TextFieldInputDate
//
//  Created by dongliyun on 2018/8/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldInputDate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TextFieldInputDate *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.maximumDate = [NSDate date];
    self.textField.defaultDate = [NSDate date];
    self.textField.dateChangedBlock = ^(NSDate *date) {
        NSLog(@"日期:%@",date);
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
