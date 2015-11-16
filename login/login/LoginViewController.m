//
//  LoginViewController.m
//  login
//
//  Created by zhouch on 15/11/11.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "LoginViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)touchBtn:(id)sender {
  //检查Touch ID 功能是否可用
    LAContext *context = [LAContext new];
    __block NSString *msg;
    NSError *error;
    BOOL success;
    success = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (success) {
        NSLog(@"恭喜，Touch ID可以使用！");
        msg = [NSString stringWithFormat:NSLocalizedString(@"TOUCH_ID_IS_AVAILABLE", nil)];
        
    }
    else
    {
         msg = [NSString stringWithFormat:NSLocalizedString(@"TOUCH_ID_IS_NOT_AVAILABLE", nil)];
    }
    
  //获取指纹验证结果
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(@"UNLOCK_ACCESS_TO_LOCKED_FATUR", nil) reply:^(BOOL success, NSError *error) {
        if (success) {
            msg = [NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_SUCCESS", nil)];
        }
        else
        {
            
             msg = [NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_WITH_ERROR", nil)];
        }
    }];
    
    
}



@end
