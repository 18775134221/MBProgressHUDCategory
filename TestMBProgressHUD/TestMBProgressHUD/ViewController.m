//
//  ViewController.m
//  TestMBProgressHUD
//
//  Created by MAC on 2016/12/26.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showHint:@"测试数据" afterDelay:3.0];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
