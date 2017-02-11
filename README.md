
# 基于基于MBProgressHUD二次封装

#### 主要功能
> 
- 1.显示带图片的弹窗
- 2.进度样式的加载指示器
- 3.普通样式的加载指示器
- 4.Toast弹窗

eg:
```
extern void showStatusHUD(UIView *contentView,NSString *status,NSString *showImageStr);
extern void showProgressHUD(UIView *contentView,NSString *status,CGFloat progress);
extern void showMaskHUD(UIView *contentView,NSString *status);
extern void showToastHUD(UIView *contentView,NSString *status,NSTimeInterval time);
extern void hideHUD(UIView *contentView);
```

