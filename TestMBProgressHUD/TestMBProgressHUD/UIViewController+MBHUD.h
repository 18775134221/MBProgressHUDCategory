//
//  UIViewController+MBHUD.h
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/10.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBHUD)

extern void showStatusHUD(NSString *status,NSString *showImageStr);
extern void showProgressHUD(NSString *status,CGFloat progress);
extern void showMaskHUD(NSString *status);
extern void showToastHUD(NSString *status,NSTimeInterval time);
extern void hideHUD();

@end
