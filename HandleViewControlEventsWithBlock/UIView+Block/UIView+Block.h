//
//  ViewController.m
//  HandleViewControlEventsWithBlock
//
//  Created by chenyilong on 15/4/21.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)();

@interface UIView (Block)

- (void)handleViewControlEvents:(UIControlEvents)controlEvents withBlock:(ActionBlock)block;

@end
