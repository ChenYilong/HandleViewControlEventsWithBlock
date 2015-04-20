//
//  ViewController.m
//  _redBlockViewControlEventsWithBlock
//
//  Created by chenyilong on 15/4/21.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Block.h"
#import "UIImage+ResizeImg.h"

@interface ViewController () {
    UIView *_yellowGestureView;
    UIView *_redBlockView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleViewWithBlock];
    [self handleViewViewWithGestureView];
}

- (void)handleViewWithBlock {
    _redBlockView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _redBlockView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2-100);
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"block_normal"] drawInRect:_redBlockView.bounds];
    _redBlockView.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    
    [_redBlockView handleViewControlEvents:UIControlEventTouchUpInside withBlock:^() {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"highlighted"] drawInRect:_yellowGestureView.bounds];
        _redBlockView.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
        UIGraphicsEndImageContext();
    }];
    [self.view addSubview:_redBlockView];
}

- (void)handleViewViewWithGestureView {
    _yellowGestureView = [[UIView alloc] init];
    _yellowGestureView.frame = CGRectMake(100, 100, 100, 100);
    _yellowGestureView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, CGRectGetMaxY(_redBlockView.frame) +100);
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"yellow_normal"] drawInRect:_yellowGestureView.bounds];
    _yellowGestureView.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    
    //添加手势
    UILongPressGestureRecognizer *longPressUIyellowGestureView = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressUIyellowGestureView:)];
    [longPressUIyellowGestureView setMinimumPressDuration:0.001];
    [_yellowGestureView addGestureRecognizer:longPressUIyellowGestureView];
    [self.view addSubview:_yellowGestureView];
}

- (void)longPressUIyellowGestureView:(UILongPressGestureRecognizer*)gesture {
    //手势开始时,设置背景为类似UIButton的高亮状态
    if ( gesture.state == UIGestureRecognizerStateBegan ){
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"highlighted"] drawInRect:_yellowGestureView.bounds];
        _yellowGestureView.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
        UIGraphicsEndImageContext();
    }
    //手势结束时,设置背景为类似UIButton的yellow_yellow_normal状态,并执行类似UIButton的如下方法
    //[button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"yellow_normal"] drawInRect:_yellowGestureView.bounds];
        _yellowGestureView.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
        UIGraphicsEndImageContext();
        [self yellowGestureViewClicked:nil];
        //NSLog(@"Long Press");
    }
}

- (void)yellowGestureViewClicked:(id)sender {
    NSLog(@"yellow");
}
@end
