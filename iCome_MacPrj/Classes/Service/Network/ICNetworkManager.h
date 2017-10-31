//
//  ICNetworkManager.h
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/31.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICNetworkHelper.h"
typedef void(^HttpSuccessCompletionHandle)(id object);
typedef void(^HttpFailureCompletionHandle)(NSError *error);
typedef void(^Progress)(NSProgress *pro);
typedef void (^RequestCache)(id responseCache);

typedef void (^OtherSuccess)(id object,NSString *key);
typedef void (^OtherFailure)(NSError *error,NSString *key);

@interface ICNetworkManager : NSObject

+(instancetype)sharedInstance;

// base api
- (NSString *) appendRequestBaseURL:(NSString *)path;


- (void)login:(NSDictionary *)param
      success:(HttpSuccessCompletionHandle)success
      failure:(HttpFailureCompletionHandle)failure;

@end
