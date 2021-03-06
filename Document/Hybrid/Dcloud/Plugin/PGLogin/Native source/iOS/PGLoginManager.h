//
//  PGLoginManager.h
//  Plugin-test
//
//  Created by Samson on 16/5/18.
//  Copyright © 2016年 Emin. All rights reserved.
//

#import "PGPlugin.h"
#import "PGMethod.h"

@interface PGLoginManager : PGPlugin

// 用户登陆
- (void)userLogin:(PGMethod *)param;
// 用户注册
- (void)userRegister:(PGMethod *)param;
// 忘记密码
- (NSData *)forgetPassword:(PGMethod *)param;
// 用户登出
- (NSData *)logout:(PGMethod *)param;
// 用户签到
- (void)checkin:(PGMethod *)param;

@end
