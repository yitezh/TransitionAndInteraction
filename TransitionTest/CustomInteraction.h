//
//  CustomInteraction.h
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomTransition.h"
typedef NS_ENUM(NSUInteger, InteractiveTransitionGestureDirection) {//手势的方向
    InteractiveGestureDirectionLeft = 0,
    InteractiveGestureDirectionRight,
    InteractiveGestureDirectionUp,
    InteractiveGestureDirectionDown
};
@interface CustomInteraction : UIPercentDrivenInteractiveTransition

@property (assign,nonatomic) BOOL interation;
@property (assign,nonatomic) TransitionType animationType;
@property (assign,nonatomic) InteractiveTransitionGestureDirection direction;
@property (copy, nonatomic) dispatch_block_t presentConifg;
@property (copy, nonatomic) dispatch_block_t dismissBlock;
- (void)addPanGestureForViewController:(UIViewController *)viewController;
@end
