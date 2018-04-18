//
//  CustomTransition.h
//  TransitionTest
//
//  Created by ytz on 2018/1/9.
//  Copyright © 2018年 ytz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,TransitionType) {
    TransitionPresent,
    TransitionDismiss,
};
@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>


@property (assign,nonatomic)TransitionType animationType ;
@end
