//
//  UIView+HUD.m
//  MBHud
//
//  Created by egood001 on 15/11/30.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

static const void *LoadingHUDKey = &LoadingHUDKey;
@implementation UIViewController (HUD)

// 动态增加属性
- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, LoadingHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, LoadingHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
 * @brief Toast提示窗口（常用于带图片提示）
 * @param inView 当前的View
 * @param imageNameStr 图片名称
 * @param msg 提示的信息
 * @param delayTime 持续的时间
 */
- (void) showStatusImageName:(NSString *) imageNameStr msg:(NSString *)msg delayTime:(NSTimeInterval)delayTime {
    [self hideHud];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageNameStr]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = msg;
    [self.view addSubview:hud];
    [hud showAnimated:YES];
    [self setHUD:hud];
    [hud hideAnimated:YES afterDelay:delayTime];

}

/*
 * @brief 显示加载提示框
 */
- (void)showHudHint:(NSString *)hint {
    [self hideHud];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.label.text = hint;
    [self.view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

/*
 * @brief Toast提示窗口
 * @param hint 提示的信息
 * @param delayTime 持续的时间
 */
- (void)showHint:(NSString *)hint afterDelay:(NSTimeInterval)delayTime{
    [self hideHud];
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delayTime];
}

/*
 * @brief Toast提示窗口
 * @param hint 提示的信息
 * @param yOffset 偏移的位置
 * @param delayTime 持续的时间
 */
- (void)showHint:(NSString *)hint yOffset:(float)yOffset afterDelay:(NSTimeInterval)delayTime {
    [self hideHud];
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    //hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delayTime];
}

- (void)hideHud{
    [[self HUD] hideAnimated:YES];
}
@end
