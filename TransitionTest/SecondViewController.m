//
//  SecondViewController.m
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"delloc %s" ,__PRETTY_FUNCTION__);
}


- (IBAction)buttonClicked:(id)sender {
    [self dismissVC];
}
- (void)hitUnknow {
    [self dismissVC];
}

- (void)dismissVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
