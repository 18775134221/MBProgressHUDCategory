MBProgressHUD分类文件
====================================================

# 一、Loading指示器
`/* 
 * @brief 显示加载提示框
 */`
 
`     
-(void)showHudHint:(NSString *)hint {

    [self hideHud];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.label.text = hint;
    [self.view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}`
    

# 二、Toast 弹窗

`/*
 * @brief Toast提示窗口
 * @param hint 提示的信息
 * @param delayTime 持续的时间
 */`
 
`-(void)showHint:(NSString *)hint afterDelay:(NSTimeInterval)delayTime {

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
}`

