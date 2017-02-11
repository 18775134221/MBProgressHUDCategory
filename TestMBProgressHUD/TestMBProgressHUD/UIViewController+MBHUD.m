//
//  UIViewController+MBHUD.m
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/10.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "UIViewController+MBHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

static const CGFloat kHudTag = 99999;
static const CGFloat kProgressHudTag = 88888;

@implementation UIViewController (MBHUD)

#pragma mark - public Methods

void ShowStatusHUD(UIView *contentView,NSString *status,NSString *showImageStr) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ShowStatusHUDFunction(contentView,status, showImageStr);
        });
    }else {
        ShowStatusHUDFunction(contentView,status, showImageStr);
    }
}

void ShowProgressHUD(UIView *contentView,NSString *status,CGFloat progress) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ShowProgressHUDFunction(contentView,status, progress);
        });
    }else {
        ShowProgressHUDFunction(contentView,status, progress);
    }
}

void ShowToastHUD(UIView *contentView,NSString *status, NSTimeInterval time) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ShowToastHUDFunction(contentView,status, time);
        });
    }else {
        ShowToastHUDFunction(contentView,status, time);
    }
}

void ShowMaskHUD(UIView *contentView,NSString *status) {
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ShowMaskHUDFunction(contentView,status);
        });
    }else {
        ShowMaskHUDFunction(contentView,status);
    }
}

void HideHUD(UIView *contentView){
    if (! [NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            HideHUDFunction(contentView);
        });
    }else {
        HideHUDFunction(contentView);
    }
}

#pragma mark - private Methods

void ShowStatusHUDFunction(UIView *contentView,NSString *status,NSString *showImageStr) {
    HideHUD(contentView);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:contentView animated:YES];
    hud.tag = kHudTag;
    UIImage *image = [[UIImage imageNamed:showImageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc]initWithImage:image];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = status;
    [hud hideAnimated:YES afterDelay:3.0];
}

void ShowProgressHUDFunction(UIView *contentView,NSString *status,CGFloat progress) {
    if ([contentView viewWithTag:kHudTag]) {
        [contentView viewWithTag:kHudTag].hidden = YES;
        [[contentView viewWithTag:kHudTag] removeFromSuperview];
    }
    MBProgressHUD *hud = [MBProgressHUD HUDForView:contentView];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:contentView animated:NO];
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

void ShowToastHUDFunction(UIView *contentView,NSString *status, NSTimeInterval time) {
    HideHUD(contentView);
    //显示提示信息;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:contentView animated:YES];
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

void ShowMaskHUDFunction(UIView *contentView,NSString *status) {
    HideHUD(contentView);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:contentView animated:YES];
    hud.tag = kHudTag;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    hud.contentColor = [UIColor whiteColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    hud.label.text = status;
    [hud showAnimated:YES];
}

void HideHUDFunction (UIView *contentView) {
    MBProgressHUD *hud = nil;
    if ([contentView viewWithTag:kHudTag]) {
        hud = [contentView viewWithTag:kHudTag];
        [hud hideAnimated:YES];
    }
    if ([contentView viewWithTag:kProgressHudTag]) {
        hud = [contentView viewWithTag:kProgressHudTag];
        [hud hideAnimated:YES];
    }
    [MBProgressHUD hideHUDForView:contentView animated:YES];
}
@end
