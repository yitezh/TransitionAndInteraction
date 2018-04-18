//
//  ViewController.m
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomTransition.h"
#import "CustomInteraction.h"
@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) CustomInteraction *pushInterAction;
@property (nonatomic,strong) CustomInteraction *popInterAction;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeof(self)weakSelf = self;
    
    _pushInterAction = [[CustomInteraction alloc] init];
    [_pushInterAction addPanGestureForViewController:self];

    _pushInterAction.animationType = TransitionPresent;
    _pushInterAction.direction = InteractiveGestureDirectionRight;
    _pushInterAction.presentConifg = ^(){
        [weakSelf toSecondView];
    };
    
}


- (void)dealloc
{
    NSLog(@"delloc %s" ,__PRETTY_FUNCTION__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toSecondView {
  
    typeof(self)weakSelf = self;
    SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    _popInterAction = [[CustomInteraction alloc] init];
    [_popInterAction addPanGestureForViewController:secondView];
    
    _popInterAction.animationType = TransitionDismiss;
    _popInterAction.direction = InteractiveGestureDirectionLeft;

    _popInterAction.dismissBlock = ^(){
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    
    secondView.modalPresentationStyle = UIModalPresentationCustom;
    secondView.transitioningDelegate = self;
    [self presentViewController:secondView animated:YES completion:nil];
    
   
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    //这里我们初始化presentType
    CustomTransition *customer = [[CustomTransition alloc] init];
    customer.animationType = TransitionPresent;
    
    return customer;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    //这里我们初始化dismissType
    CustomTransition *customer = [[CustomTransition alloc] init];
    customer.animationType = TransitionDismiss;
    
    return customer;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    return _popInterAction.interation ? _popInterAction : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{

    return _pushInterAction.interation ? _pushInterAction : nil;
}



- (IBAction)buttonClicked:(id)sender {
    [self toSecondView];
}
@end
