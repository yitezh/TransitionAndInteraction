//
//  CustomTransition.m
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import "CustomTransition.h"

@implementation CustomTransition

#define SCREEN_WIDTH                     ([[UIScreen mainScreen] bounds].size.width)
#define MASKTAG 10019
#define RightOffset    50
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (self.animationType) {
        case TransitionPresent:
            [self presentAnimation:transitionContext];
            break;
            
        case TransitionDismiss:
            [self dismissAnimation:transitionContext];
            break;
    }
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    UIView *containerView = [transitionContext containerView];
    toView.frame = CGRectMake(-SCREEN_WIDTH+RightOffset, toView.frame.origin.y, SCREEN_WIDTH-RightOffset, toView.frame.size.height);
    
    
    UIImageView *maskView = [[UIImageView alloc]initWithFrame:containerView.frame];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.1;
    maskView.tag = MASKTAG;
    [containerView addSubview:maskView];
    [containerView sendSubviewToBack:maskView];
    
    [containerView addSubview:toView];

  
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       toView.frame = CGRectMake(0, toView.frame.origin.y,  SCREEN_WIDTH-RightOffset, toView.frame.size.height);
       maskView.alpha = 0.5;
       fromView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-RightOffset, fromView.frame.origin.y, fromView.frame.size.width, fromView.frame.size.height);
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [maskView removeFromSuperview];
            [transitionContext completeTransition:NO];
        }
        else {
            [transitionContext completeTransition:YES];
            
        }
    }];
}
//实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    UIView *containerView = [transitionContext containerView];
    UIImageView *maskView = [containerView viewWithTag:MASKTAG];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        maskView.alpha = 0;
        fromView.frame = CGRectMake(-fromView.frame.size.width, fromView.frame.origin.y, fromView.frame.size.width, fromView.frame.size.height);
        toView.frame = CGRectMake(0, toView.frame.origin.y, toView.frame.size.width, toView.frame.size.height);
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }
        else {
            [fromView removeFromSuperview];
            [maskView removeFromSuperview];
            [transitionContext completeTransition:YES];
            
        }
    }];
}




@end
