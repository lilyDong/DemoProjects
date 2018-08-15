//
//  TextFieldInputDate.m
//  TextFieldInputDate
//
//  Created by dongliyun on 2018/8/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "TextFieldInputDate.h"

@interface TextFieldInputDate()
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end
@implementation TextFieldInputDate
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.textColor = [UIColor grayColor];
        self.font = [UIFont systemFontOfSize:14];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 4.0f;
        self.clipsToBounds = YES;
        
        self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
        self.leftViewMode = UITextFieldViewModeAlways;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        imageView.image = [UIImage imageNamed:@"calendar"];
        imageView.contentMode = UIViewContentModeCenter;
        self.rightView = imageView;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        self.inputView = self.datePicker;
        // 英文语言下，没有完成按钮，自定义添加下
        UIToolbar *toobar = [[UIToolbar alloc] init];
        toobar.backgroundColor = [UIColor grayColor];
        toobar.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 44);
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(clickDone:)];
        toobar.items = @[flexibleItem,doneBtnItem];
        self.inputAccessoryView = toobar;
    }
    return self;
}

- (void)clickDone:(UIBarButtonItem*)btnItem{
    [self resignFirstResponder];
}
- (void) dateChanged:(UIDatePicker*) datePicker{
    NSDate* date = datePicker.date;
    self.currentDate = date;
    if (self.dateChangedBlock) {
        self.dateChangedBlock(date);
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(paste:)){ //禁止粘贴
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}
#pragma mark - Custom Accessors

- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;
    self.text = [self.dateFormatter stringFromDate:_currentDate];
}

- (void)setMaximumDate:(NSDate *)maximumDate{
    _maximumDate = maximumDate;
    self.datePicker.maximumDate = maximumDate;
}

- (void)setMinimumDate:(NSDate *)minimumDate{
    _minimumDate = minimumDate;
    self.datePicker.minimumDate = minimumDate;
}

- (void)setDefaultDate:(NSDate *)defaultDate{
    _defaultDate = defaultDate;
    self.currentDate = defaultDate;
}

- (UIDatePicker *)datePicker{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        [_datePicker setTimeZone:[NSTimeZone systemTimeZone]];
        [_datePicker setDate:[NSDate date]];
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        [_datePicker setLocale:[NSLocale autoupdatingCurrentLocale]];
        [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        [_datePicker setBackgroundColor:[UIColor whiteColor]];
    }
    return _datePicker;
}

- (NSDateFormatter *)dateFormatter{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
        [_dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [_dateFormatter setDateFormat:@"yyyy/MM/dd"];
    }
    return _dateFormatter;
}
@end
