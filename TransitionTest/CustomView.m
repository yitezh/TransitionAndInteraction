//
//  CustomView.m
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(hitUnknow)]) {
        [self.delegate hitUnknow];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (!hitView) {
        hitView = self;
    }
    return hitView;
}
@end
