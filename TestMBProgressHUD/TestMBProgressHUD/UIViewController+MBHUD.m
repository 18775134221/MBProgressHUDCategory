//
//  UIViewController+MBHUD.m
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/10.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "UIViewController+MBHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "AppDelegate.h"

#define JQAppWindow  [[UIApplication sharedApplication].delegate window]
static const CGFloat kHudTag = 99999;
static const CGFloat kProgressHudTag = 88888;

@implementation UIViewController (MBHUD)

#pragma mark - public Methods

void showStatusHUD(NSString *status,NSString *showImageStr) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showStatusHUD(status, showImageStr);
        });
    }else {
        showStatusHUD(status, showImageStr);
    }
}

void showProgressHUD(NSString *status,CGFloat progress) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showProgressHUDFunction(status, progress);
        });
    }else {
        showProgressHUDFunction(status, progress);
    }
}

void showToastHUD(NSString *status, NSTimeInterval time) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showToastHUD(status, time);
        });
    }else {
        showToastHUD(status, time);
    }
}

void showMaskHUD(NSString *status) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showMaskHUDFunction(status);
        });
    }else {
        showMaskHUDFunction(status);
    }
}

void hideHUD(){
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hideHUDFunction();
        });
    }else {
        hideHUDFunction();
    }
}

#pragma mark - private Methods

void showStatusHUDFunction(NSString *status,NSString *showImageStr) {
    hideHUD();
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:JQAppWindow animated:YES];
    hud.tag = kHudTag;
    UIImage *image = [[UIImage imageNamed:showImageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc]initWithImage:image];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = status;
    [hud hideAnimated:YES afterDelay:3.0];
}

void showProgressHUDFunction(NSString *status,CGFloat progress) {
    if ([JQAppWindow viewWithTag:kHudTag]) {
        [JQAppWindow viewWithTag:kHudTag].hidden = YES;
        [[JQAppWindow viewWithTag:kHudTag] removeFromSuperview];
    }
    MBProgressHUD *hud = [MBProgressHUD HUDForView:JQAppWindow];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:JQAppWindow animated:NO];
    }
    hud.tag = kProgressHudTag;
    hud.mode = MBProgressHUDModeDeterminate;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.userInteractionEnabled = NO;
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = status;
    hud.label.textColor = [UIColor whiteColor];
    hud.progress = progress;
}

void showToastHUDFunction(NSString *status, NSTimeInterval time) {
    hideHUD();
    //显示提示信息;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:JQAppWindow animated:YES];
    hud.tag = kHudTag;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = status;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:time];
}

void showMaskHUDFunction(NSString *status) {
    hideHUD();
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:JQAppWindow animated:YES];
    hud.tag = kHudTag;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    hud.contentColor = [UIColor whiteColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    hud.label.text = status;
    [hud showAnimated:YES];
}

void hideHUDFunction () {
    MBProgressHUD *hud = nil;
    if ([JQAppWindow viewWithTag:kHudTag]) {
        hud = [JQAppWindow viewWithTag:kHudTag];
        [hud hideAnimated:YES];
    }
    if ([JQAppWindow viewWithTag:kProgressHudTag]) {
        hud = [JQAppWindow viewWithTag:kProgressHudTag];
        [hud hideAnimated:YES];
    }
    [MBProgressHUD hideHUDForView:JQAppWindow animated:YES];
}
@end
