//
//  TextFieldInputDate.h
//  TextFieldInputDate
//
//  Created by dongliyun on 2018/8/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 选日期的TextField
 */
@interface TextFieldInputDate : UITextField

/**
 默认初始日期
 */
@property (nonatomic, strong) NSDate *defaultDate;

/**
 可设置最大日期
 */
@property (nonatomic, strong) NSDate *maximumDate;

/**
 可设置最小日期
 */
@property (nonatomic, strong) NSDate *minimumDate;

/**
 当前设置的日期
 */
@property (nonatomic, strong) NSDate *currentDate;

/**
 日期改变
 */
@property (nonatomic, copy) void (^dateChangedBlock)(NSDate *date);

@end
