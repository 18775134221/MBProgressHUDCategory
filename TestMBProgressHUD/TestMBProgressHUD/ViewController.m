//
//  ViewController.m
//  TestMBProgressHUD
//
//  Created by MAC on 2016/12/26.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MBHUD.h"

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
        showProgressHUD(self.view,@"加载中", self.progress);
    }else if(self.progress >= 1.0) {
        hideHUD(self.view);
        [self.timer invalidate];
        self.timer = nil;
        self.progress = 0;
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[self showHint:@"测试数据" afterDelay:3.0];
    //hideHUD();
    //showToastHUD(@"测试", 3);
    //showMaskHUD(@"加载中...");
    //hideHUD();
    showMaskHUD(self.view,@"加载中");
    hideHUD(self.view);
    if (! self.timer) {
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(test) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
