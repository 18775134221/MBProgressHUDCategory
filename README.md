
# 一、基于基于MBProgressHUD二次封装

#### 主要功能
> 
- 1.显示带图片的弹窗
- 2.进度样式的加载指示器
- 3.普通样式的加载指示器
- 4.Toast弹窗

eg:
```
extern void ShowStatusHUD(UIView *contentView,NSString *status,NSString *showImageStr);
extern void ShowProgressHUD(UIView *contentView,NSString *status,CGFloat progress);
extern void ShowMaskHUD(UIView *contentView,NSString *status);
extern void ShowToastHUD(UIView *contentView,NSString *status,NSTimeInterval time);
extern void HideHUD(UIView *contentView);
```

# 二、基于基于SVProgressHUD二次封装

#### 主要功能
> 
- 1.显示带图片的成功弹窗
- 2.显示带图片的失败弹窗
- 2.进度样式的加载指示器
- 3.普通样式的加载指示器
- 4.Toast弹窗


```
extern void ShowSuccessStatus(NSString *statues);
extern void ShowErrorStatus(NSString *statues);
extern void ShowMaskStatus(NSString *statues);
extern void ShowMessage(NSString *statues);
extern void ShowProgress(CGFloat progress);
extern void DismissHud(void);
```
