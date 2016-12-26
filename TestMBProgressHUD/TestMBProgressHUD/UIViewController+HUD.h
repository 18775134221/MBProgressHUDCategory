//
//  UIView+HUD.h
//  MBHud
//
//  Created by egood001 on 15/11/30.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

/*
 * @brief 显示加载提示框
 */
- (void)showHudHint:(NSString *)hint;

/*
 * @brief 移除加载提示框
 */
- (void)hideHud;


/*
 * @brief Toast提示窗口
 * @param hint 提示的信息
 * @param delayTime 持续的时间
 */
- (void)showHint:(NSString *)hint afterDelay:(NSTimeInterval)delayTime;

/*
 * @brief Toast提示窗口（常用于带图片提示）
 * @param inView 当前的View
 * @param imageNameStr 图片名称
 * @param msg 提示的信息
 * @param delayTime 持续的时间
 */
- (void) showStatusImageName:(NSString *) imageNameStr msg:(NSString *)msg delayTime:(NSTimeInterval)delayTime;

/*
 * @brief Toast提示窗口
 * @param hint 提示的信息
 * @param yOffset 偏移的位置
 * @param delayTime 持续的时间
 */
- (void)showHint:(NSString *)hint yOffset:(float)yOffset afterDelay:(NSTimeInterval)delayTime;

@end
