//
//  SVProgressToolsCenter.h
//  TestMBProgressHUD
//
//  Created by MAC on 2017/2/11.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SVProgressToolsCenter : NSObject

extern void ShowSuccessStatus(NSString *statues);
extern void ShowErrorStatus(NSString *statues);
extern void ShowMaskStatus(NSString *statues);
extern void ShowMessage(NSString *statues);
extern void ShowProgress(CGFloat progress);
extern void DismissHud(void);

@end
