//
//  ViewController.m
//  HandleViewControlEventsWithBlock
//
//  Created by chenyilong on 15/4/21.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "UIView+Block.h"
#import <objc/runtime.h>

static char kViewEventsBlockKey;

@implementation UIView (Block)

- (void)handleViewControlEvents:(UIControlEvents)controlEvents withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &kViewEventsBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewSelect:)];
    [self addGestureRecognizer:tgr];
}

- (void)viewSelect:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &kViewEventsBlockKey);
    if (block) {
        block();
    }
}

@end
