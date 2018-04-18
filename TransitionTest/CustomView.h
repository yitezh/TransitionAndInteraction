//
//  CustomView.h
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate<NSObject>
- (void)hitUnknow ;
@end
@interface CustomView : UIView
@property (weak, nonatomic) IBOutlet id<CustomViewDelegate> delegate;

//@property (strong, nonatomic) IBAction SEL touchKnow;

@end
