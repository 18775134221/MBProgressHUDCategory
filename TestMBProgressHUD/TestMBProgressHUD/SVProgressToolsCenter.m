//
//  SVProgressToolsCenter.m
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/11.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "SVProgressToolsCenter.h"
#import "SVProgressHUD.h"

@implementation SVProgressToolsCenter

+ (void)load{
    // 如果这个属性不设置，则不能设置背景色，和前景色
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.8]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:15.0f]];
    [SVProgressHUD setCornerRadius:8.0f];
    [SVProgressHUD setInfoImage:nil];
}

void ShowSuccessStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置展示的时间
            [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
            [SVProgressHUD showSuccessWithStatus:statues];
        });
    }else{
        [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
        [SVProgressHUD showSuccessWithStatus:statues];
    }
}

void ShowMessage(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
            [SVProgressHUD showInfoWithStatus:statues];
        });
    }else{
        [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
        [SVProgressHUD showInfoWithStatus:statues];
    }
}

void ShowErrorStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
            [SVProgressHUD showErrorWithStatus:statues];
        });
    }else{
        [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
        [SVProgressHUD showErrorWithStatus:statues];
    }
}

void ShowMaskStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showWithStatus:statues];
        });
    }else{
        [SVProgressHUD showWithStatus:statues];
    }
}

void ShowProgress(CGFloat progress){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showProgress:progress];
        });
    }else{
        [SVProgressHUD showProgress:progress];
    }
}
void DismissHud(void){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }else{
        [SVProgressHUD dismiss];
    }
}

@end
