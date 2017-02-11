//
//  ViewController.m
//  TestMBProgressHUD
//
//  Created by MAC on 2016/12/26.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressToolsCenter.h"
#import "SVProgressToolsCenter.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void) test {
    self.progress += 0.01;
    if (self.progress < 1.0) {
        ShowProgressHUD(self.view,@"加载中", self.progress);
    }else if(self.progress >= 1.0) {
        HideHUD(self.view);
        [self.timer invalidate];
        self.timer = nil;
        self.progress = 0;
    }

}

- (void) mb {
    //[self showHint:@"测试数据" afterDelay:3.0];
    //hideHUD();
    //showToastHUD(@"测试", 3);
    //showMaskHUD(@"加载中...");
    //hideHUD();
    ShowMaskHUD(self.view,@"加载中");
    HideHUD(self.view);
    if (! self.timer) {
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(test) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //ShowMessage(@"我是一个提示窗口");
    //ShowSuccessStatus(@"加载中...");
    //ShowErrorStatus(@"加载中...");
    //ShowProgress(0.5);
    ShowMaskStatus(@"123");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
