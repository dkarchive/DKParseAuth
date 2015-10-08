//
//  MyHud.m
//  DKParseAuthDemo
//
//  Created by Daniel Khamsing on 10/7/15.
//  Copyright © 2015 Daniel Khamsing. All rights reserved.
//

#import "MyHud.h"
#import "SVProgressHUD.h"

@implementation MyHud

- (void)hideInView:(UIView *)view animationDuration:(CGFloat)duration {
    [SVProgressHUD dismiss];
}

- (void)showInView:(UIView *)view animationDuration:(CGFloat)duration {
    [SVProgressHUD show];
}

@end
