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

@implementation UIViewController (MBHUD)

+ (void)load {
}


void showError(NSString *status,NSString *showImageStr) {
    hideHUD();
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:showImageStr]];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = status;
    [hud hideAnimated:YES afterDelay:3.0];

}

void showSuccess(NSString *status,NSString *showImageStr) {
    hideHUD();
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:showImageStr]];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = status;
    [hud hideAnimated:YES afterDelay:3.0];
}

void showToastHUD(NSString *status,NSTimeInterval time) {
    hideHUD();
    //显示提示信息
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = status;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:time];
}

void showMaskHUD(NSString *status) {
    hideHUD();
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    hud.contentColor = [UIColor whiteColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    hud.label.text = status;
    [hud showAnimated:YES];
}

void hideHUD(){
//    if (![NSThread isMainThread]) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//        });
//    }else{
//    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:window animated:YES];
}
@end
