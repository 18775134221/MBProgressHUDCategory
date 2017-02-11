//
//  UIViewController+MBHUD.h
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/10.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBHUD)

extern void showStatusHUD(UIView *contentView,NSString *status,NSString *showImageStr);
extern void showProgressHUD(UIView *contentView,NSString *status,CGFloat progress);
extern void showMaskHUD(UIView *contentView,NSString *status);
extern void showToastHUD(UIView *contentView,NSString *status,NSTimeInterval time);
extern void hideHUD(UIView *contentView);

@end
