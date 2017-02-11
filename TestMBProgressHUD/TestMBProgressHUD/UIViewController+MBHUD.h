//
//  UIViewController+MBHUD.h
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/10.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBHUD)

extern void ShowStatusHUD(UIView *contentView,NSString *status,NSString *showImageStr);
extern void ShowProgressHUD(UIView *contentView,NSString *status,CGFloat progress);
extern void ShowMaskHUD(UIView *contentView,NSString *status);
extern void ShowToastHUD(UIView *contentView,NSString *status,NSTimeInterval time);
extern void HideHUD(UIView *contentView);

@end
